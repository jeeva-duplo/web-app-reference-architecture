
locals {
  plan_id     = var.infra_name
  tenant_name = terraform.workspace
  region      = data.duplocloud_infrastructure.infra.region
}

data "duplocloud_infrastructure" "infra" {
  infra_name = var.infra_name
}
