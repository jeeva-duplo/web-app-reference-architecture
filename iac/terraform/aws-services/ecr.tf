
resource "duplocloud_aws_ecr_repository" "frontend" {
  tenant_id                 = local.tenant_id
  name                      = "${local.tenant_name}-frontend"
  enable_scan_image_on_push = true
  enable_tag_immutability   = false
}

resource "duplocloud_aws_ecr_repository" "serverless" {
  tenant_id                 = local.tenant_id
  name                      = "${local.tenant_name}-serverless"
  enable_scan_image_on_push = true
  enable_tag_immutability   = false
}
