
resource "duplocloud_duplo_service" "frontend" {
  tenant_id                            = local.tenant_id
  name                                 = "frontend"
  replicas                             = var.replica_count
  lb_synced_deployment                 = false
  cloud_creds_from_k8s_service_account = true
  is_daemonset                         = false
  is_unique_k8s_node_required          = true
  agent_platform                       = 7
  cloud                                = 0
  other_docker_config = jsonencode({
    "Volumes" : [


      # Define the CSI volume for the env var example
      { "Name" : "database",
        "Csi" : {
          "driver" : "secrets-store.csi.k8s.io",
          "readOnly" : true,
          "volumeAttributes" : {
            "secretProviderClass" : duplocloud_k8_secret_provider_class.database.name
          }
        }
      }
    ]
    "VolumesMounts" : [

      {
        "Name" : "database",
        "MountPath" : "/mnt/fieldsenvvar",
        "readOnly" : true
      }
    ],
    "EnvFrom" : [
      {
        "SecretRef" : {
          "name" : duplocloud_k8_secret_provider_class.database.secret_object[0].name
        }
      }
    ]
    "Env" : [

      {
        "name" : "INTEGRATION_API_KEY",
        "valueFrom" : {
          "secretKeyRef" : {
            "key" : "integration_api_key",
            "name" : "integration"
          }
        }
      },
      {
        "Name" : "DUPLO",
        "Value" : "true"
      },
      {
        "Name" : "SQS_FULLNAME",
        "Value" : local.sqs_fullname
      },
      {
        "Name" : "AWS_REGION",
        "Value" : local.region
      }


    ]
    }
  )
  docker_image = local.default_frontend_docker_image
  volumes = jsonencode([
    {
      "Name" : "data",
      "Path" : "/data",
      "Spec" : {
        "ConfigMap" : {
          "Name" : "frontend"
        }
      }
    }
    ]
  )
  lifecycle {
    ignore_changes = [
      docker_image
    ]
  }
}

resource "duplocloud_duplo_service_params" "myservice" {
  tenant_id = local.tenant_id

  replication_controller_name = duplocloud_duplo_service_lbconfigs.frontend_config.replication_controller_name
  dns_prfx                    = terraform.workspace
  drop_invalid_headers        = true
  enable_access_logs          = true
  http_to_https_redirect      = true
}

resource "duplocloud_duplo_service_lbconfigs" "frontend_config" {
  tenant_id                   = duplocloud_duplo_service.frontend.tenant_id
  replication_controller_name = duplocloud_duplo_service.frontend.name

  lbconfigs {
    certificate_arn  = data.duplocloud_plan_certificates.certs.certificates[0].arn
    lb_type          = 1
    is_native        = false
    is_internal      = false
    port             = 3000
    external_port    = 443
    protocol         = "http"
    health_check_url = "/"
  }
}


resource "duplocloud_k8_config_map" "frontend" {
  tenant_id = local.tenant_id

  name = "frontend"

  data = jsonencode({ foo = "bar2" })
}
