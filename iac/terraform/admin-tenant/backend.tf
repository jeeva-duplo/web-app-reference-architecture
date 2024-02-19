terraform {
  backend "s3" {
    region               = "us-east-1"
    key                  = "tenant"
    workspace_key_prefix = "admin:"
    encrypt              = true
  }
}
