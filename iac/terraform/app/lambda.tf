
resource "duplocloud_aws_lambda_function" "app" {

  tenant_id   = local.tenant_id
  name        = "demo"
  description = "Sample function that shows using AWS Secrets Manager"

  package_type = "Image"
  image_uri    = "463387891060.dkr.ecr.us-east-1.amazonaws.com/${terraform.workspace}-serverless:main"

  environment {
    variables = {
      "DUPLO"          = "true",
      "DB_SECRET_NAME" = "duploservices-${local.tenant_name}-${local.secret_name_suffix}"
    }
  }

  tracing_config {
    mode = "PassThrough"
  }

  timeout     = 60
  memory_size = 512
}
