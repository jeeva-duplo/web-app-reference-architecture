<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_duplocloud"></a> [duplocloud](#requirement\_duplocloud) | ~> 0.10.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_duplocloud"></a> [duplocloud](#provider\_duplocloud) | 0.10.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [duplocloud_tenant.tenant](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/tenant) | resource |
| [duplocloud_tenant_config.tenant-config](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/tenant_config) | resource |
| [duplocloud_infrastructure.infra](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/infrastructure) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_infra_name"></a> [infra\_name](#input\_infra\_name) | The DuploCloud Infrastructure that the DuploCloud Tenant will be added to | `string` | `"prod-infra"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_infra_name"></a> [infra\_name](#output\_infra\_name) | The duplo infra name. |
| <a name="output_region"></a> [region](#output\_region) | The AWS region the Tenant is located in |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | The tenant ID |
| <a name="output_tenant_name"></a> [tenant\_name](#output\_tenant\_name) | The tenant name |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The VPC or VNet ID. |
<!-- END_TF_DOCS -->