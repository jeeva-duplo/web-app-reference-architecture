
resource "duplocloud_aws_sqs_queue" "sqs_queue" {
  tenant_id                  = local.tenant_id
  name                       = "database-queue"
  fifo_queue                 = false
  message_retention_seconds  = 345600
  visibility_timeout_seconds = 30
}
