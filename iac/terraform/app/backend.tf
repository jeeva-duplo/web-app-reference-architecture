terraform {
  backend "s3" {
    region               = "us-east-1"
    key                  = "app"
    workspace_key_prefix = "tenant:"
    encrypt              = true
  }
}
