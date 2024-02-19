
resource "duplocloud_s3_bucket" "docs" {
  tenant_id           = local.tenant_id
  name                = "docs"
  allow_public_access = var.s3_allow_public_access
  enable_access_logs  = var.s3_enable_access_logs
  enable_versioning   = var.s3_enable_versioning
  managed_policies    = ["ssl"]
  default_encryption {
    method = "Sse"
  }
}
