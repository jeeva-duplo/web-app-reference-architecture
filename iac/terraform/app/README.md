<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_duplocloud"></a> [duplocloud](#requirement\_duplocloud) | ~> 0.10.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.34.0 |
| <a name="provider_duplocloud"></a> [duplocloud](#provider\_duplocloud) | 0.10.5 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [duplocloud_aws_lambda_function.app](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/aws_lambda_function) | resource |
| [duplocloud_duplo_service.frontend](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service) | resource |
| [duplocloud_duplo_service_lbconfigs.frontend_config](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service_lbconfigs) | resource |
| [duplocloud_duplo_service_params.myservice](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service_params) | resource |
| [duplocloud_k8_config_map.frontend](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/k8_config_map) | resource |
| [duplocloud_k8_secret.integration](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/k8_secret) | resource |
| [duplocloud_k8_secret_provider_class.database](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/k8_secret_provider_class) | resource |
| [duplocloud_k8s_cron_job.queue](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/k8s_cron_job) | resource |
| [duplocloud_tenant_secret.database](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/tenant_secret) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [duplocloud_plan_certificates.certs](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/plan_certificates) | data source |
| [duplocloud_plan_settings.plan](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/plan_settings) | data source |
| [duplocloud_tenant.tenant](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/tenant) | data source |
| [duplocloud_tenant_aws_region.current](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/tenant_aws_region) | data source |
| [terraform_remote_state.aws-services](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.tenant](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_integration_api_key"></a> [integration\_api\_key](#input\_integration\_api\_key) | This is dummy secret that can be set via GitHub Action Secret.  Refer to the Deployment section of the README for more details. | `string` | `""` | no |
| <a name="input_queue_schedule"></a> [queue\_schedule](#input\_queue\_schedule) | Frequency to run the k8s cronjob | `string` | `"*/5 * * * *"` | no |
| <a name="input_replica_count"></a> [replica\_count](#input\_replica\_count) | The number of replicas to run in the k8s environment | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_url"></a> [url](#output\_url) | URL for accessing the frontend |
<!-- END_TF_DOCS -->