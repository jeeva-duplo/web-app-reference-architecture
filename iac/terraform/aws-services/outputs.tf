
output "s3_fullname" {
  value       = duplocloud_s3_bucket.docs.fullname
  description = "The full name of the S3 bucket."
}
output "s3_arn" {
  value       = duplocloud_s3_bucket.docs.arn
  description = "The ARN of the S3 bucket."
}

output "region" {
  value       = local.region
  description = "The AWS Region for the Tenant"
}

output "ecr_repository_url" {
  value       = duplocloud_aws_ecr_repository.frontend.repository_url
  description = "The URL of the frontend ECR repository"
}

output "db_password" {
  value       = random_password.password.result
  description = "password for the database"
  sensitive   = true
}

output "db_username" {
  value       = var.db_username
  description = "username for the database"
}

output "db_url" {
  value       = duplocloud_rds_instance.db.host
  description = "url for the database"
}

output "sqs_fullname" {
  value       = duplocloud_aws_sqs_queue.sqs_queue.fullname
  description = "The SQS Queue fullname"
}
