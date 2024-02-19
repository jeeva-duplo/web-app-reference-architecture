
variable "replica_count" {
  type    = number
  description = "The number of replicas to run in the k8s environment"
  default = 1
}

variable "integration_api_key" {
  default   = ""
  description = "This is dummy secret that can be set via GitHub Action Secret.  Refer to the Deployment section of the README for more details."
  type      = string
  sensitive = true
}

variable "queue_schedule" {
  default = "*/5 * * * *"
  description = "Frequency to run the k8s cronjob"
  type    = string
}
