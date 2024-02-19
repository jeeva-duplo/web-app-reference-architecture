
resource "duplocloud_k8s_cron_job" "queue" {
  tenant_id = local.tenant_id
  metadata {
    name = "queue-processor"
  }
  spec {
    job_template {
      spec {
        ttl_seconds_after_finished = 900
        template {
          spec {
            restart_policy = "Never"
            container {
              name              = "scheduler"
              image             = "busybox:latest"
              image_pull_policy = "Always"
              command           = ["/bin/sh", "-c", "date; echo Hello from the Kubernetes cluster; echo the database url is: $DB_URL"]


              env {
                name  = "DUPLO"
                value = "true"
              }

              env_from {
                secret_ref {
                  name = duplocloud_k8_secret_provider_class.database.secret_object[0].name
                }

              }




            }
          }
        }
      }
    }
    schedule                      = var.queue_schedule
    failed_jobs_history_limit     = 2
    successful_jobs_history_limit = 2
  }
  lifecycle {
    ignore_changes = [
      spec[0].job_template[0].spec[0].template[0].spec[0].container[0].image
    ]
  }
}

