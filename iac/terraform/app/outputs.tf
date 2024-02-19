
output "url" {
  value       = "${terraform.workspace}${local.base_domain}"
  description = "URL for accessing the frontend"
}

