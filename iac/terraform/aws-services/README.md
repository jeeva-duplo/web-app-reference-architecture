<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_duplocloud"></a> [duplocloud](#requirement\_duplocloud) | ~> 0.10.2 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.12.0 |
| <a name="provider_duplocloud"></a> [duplocloud](#provider\_duplocloud) | 0.10.4 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.2 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nodegroup"></a> [nodegroup](#module\_nodegroup) | duplocloud/components/duplocloud//modules/eks-nodes | 0.0.5 |

## Resources

| Name | Type |
|------|------|
| [duplocloud_aws_ecr_repository.frontend](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/aws_ecr_repository) | resource |
| [duplocloud_aws_ecr_repository.serverless](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/aws_ecr_repository) | resource |
| [duplocloud_aws_sqs_queue.sqs_queue](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/aws_sqs_queue) | resource |
| [duplocloud_rds_instance.db](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/rds_instance) | resource |
| [duplocloud_s3_bucket.docs](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/s3_bucket) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [duplocloud_aws_account.aws](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/aws_account) | data source |
| [duplocloud_native_host_image.ami](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/native_host_image) | data source |
| [duplocloud_plan.plan](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/plan) | data source |
| [duplocloud_tenant.tenant](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/tenant) | data source |
| [duplocloud_tenant_aws_kms_key.tenant_kms](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/tenant_aws_kms_key) | data source |
| [duplocloud_tenant_aws_region.current](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/tenant_aws_region) | data source |
| [terraform_remote_state.tenant](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_instance_count"></a> [asg\_instance\_count](#input\_asg\_instance\_count) | Number of nodes in each ASG (one ASG per AZ) | `number` | `1` | no |
| <a name="input_asg_instance_type"></a> [asg\_instance\_type](#input\_asg\_instance\_type) | The instance type to use in the k8s worker node ASG | `string` | `"t3.xlarge"` | no |
| <a name="input_asg_os_disk_size"></a> [asg\_os\_disk\_size](#input\_asg\_os\_disk\_size) | Size of root disk on k8s worker nodes | `string` | `100` | no |
| <a name="input_az_list"></a> [az\_list](#input\_az\_list) | Which AWS AZs to use in the k8s worker node ASG | `list(string)` | <pre>[<br>  "a",<br>  "b"<br>]</pre> | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Default username to use for the RDS database | `string` | `"appadmin"` | no |
| <a name="input_s3_allow_public_access"></a> [s3\_allow\_public\_access](#input\_s3\_allow\_public\_access) | Wether or not to enable S3 public access | `bool` | `false` | no |
| <a name="input_s3_enable_access_logs"></a> [s3\_enable\_access\_logs](#input\_s3\_enable\_access\_logs) | Wether or not to enable S3 access logs | `bool` | `false` | no |
| <a name="input_s3_enable_versioning"></a> [s3\_enable\_versioning](#input\_s3\_enable\_versioning) | Wether or not to enable S3 versioning | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_password"></a> [db\_password](#output\_db\_password) | password for the database |
| <a name="output_db_url"></a> [db\_url](#output\_db\_url) | url for the database |
| <a name="output_db_username"></a> [db\_username](#output\_db\_username) | username for the database |
| <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url) | The URL of the frontend ECR repository |
| <a name="output_region"></a> [region](#output\_region) | The AWS Region for the Tenant |
| <a name="output_s3_arn"></a> [s3\_arn](#output\_s3\_arn) | The ARN of the S3 bucket. |
| <a name="output_s3_fullname"></a> [s3\_fullname](#output\_s3\_fullname) | The full name of the S3 bucket. |
| <a name="output_sqs_fullname"></a> [sqs\_fullname](#output\_sqs\_fullname) | The SQS Queue fullname |
<!-- END_TF_DOCS -->