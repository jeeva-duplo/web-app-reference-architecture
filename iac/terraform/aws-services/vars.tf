
variable "asg_instance_type" {
  default = "t3.xlarge"
  description = "The instance type to use in the k8s worker node ASG"
  type    = string
}

variable "asg_instance_count" {
  default     = 1
  description = "Number of nodes in each ASG (one ASG per AZ)"
  type        = number
}

variable "az_list" {
  default     = ["a", "b"]
  type        = list(string)
  description = "Which AWS AZs to use in the k8s worker node ASG"
}


variable "s3_allow_public_access" {
  default = false
  description = "Wether or not to enable S3 public access"
  type    = bool
}

variable "s3_enable_access_logs" {
  default = false
  description = "Wether or not to enable S3 access logs"
  type    = bool
}

variable "s3_enable_versioning" {
  default = true
  description = "Wether or not to enable S3 versioning"
  type    = bool
}

variable "asg_os_disk_size" {
  default = 100
  description = "Size of root disk on k8s worker nodes"
  type    = string
}

variable "db_username" {
  default = "appadmin"
  description = "Default username to use for the RDS database"
  type    = string
}
