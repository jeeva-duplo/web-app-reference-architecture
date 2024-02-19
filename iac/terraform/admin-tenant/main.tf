
resource "duplocloud_tenant" "tenant" {
  account_name = local.tenant_name
  plan_id      = local.plan_id
}

resource "duplocloud_tenant_config" "tenant-config" {
  tenant_id = duplocloud_tenant.tenant.tenant_id
  setting {
    key   = "delete_protection"
    value = "true"
  }
}
