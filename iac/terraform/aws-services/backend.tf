terraform {
  backend "s3" {
    region               = "us-east-1"
    key                  = "aws-services"
    workspace_key_prefix = "tenant:"
    encrypt              = true
  }
}
