data "aws_caller_identity" "current" {
}

data "duplocloud_tenant_aws_region" "current" {
  tenant_id = local.tenant_id
}

data "duplocloud_plan_certificates" "certs" {
  plan_id = data.duplocloud_tenant.tenant.plan_id
}

data "duplocloud_tenant" "tenant" {
  name = local.tenant_name
}

data "duplocloud_plan_settings" "plan" {
  plan_id = data.duplocloud_tenant.tenant.plan_id
}

locals {
  tfstate_bucket     = "duplo-tfstate-${data.aws_caller_identity.current.account_id}"
  region             = data.duplocloud_tenant_aws_region.current.aws_region
  tenant_id          = data.terraform_remote_state.tenant.outputs["tenant_id"]
  tenant_name        = data.terraform_remote_state.tenant.outputs["tenant_name"]
  db_password        = data.terraform_remote_state.aws-services.outputs["db_password"]
  db_username        = data.terraform_remote_state.aws-services.outputs["db_username"]
  db_url             = data.terraform_remote_state.aws-services.outputs["db_url"]
  sqs_fullname       = data.terraform_remote_state.aws-services.outputs["sqs_full_name"]
  secret_name_suffix = "database"
  base_domain        = data.duplocloud_plan_settings.plan.dns_setting[0].external_dns_suffix
  default_frontend_docker_image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${local.region}.amazonaws.com/${terraform.workspace}-frontend:main"
}

data "terraform_remote_state" "tenant" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    bucket               = local.tfstate_bucket
    workspace_key_prefix = "admin:"
    key                  = "tenant"
    region               = "us-west-2"
  }
}

data "terraform_remote_state" "aws-services" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    bucket               = local.tfstate_bucket
    workspace_key_prefix = "tenant:"
    key                  = "aws-services"
    region               = "us-west-2"
  }
}
