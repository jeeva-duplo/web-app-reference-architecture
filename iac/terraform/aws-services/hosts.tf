
data "duplocloud_native_host_image" "ami" {
  tenant_id     = data.terraform_remote_state.tenant.outputs.tenant_id
  is_kubernetes = true
}

module "nodegroup" {

  source       = "duplocloud/components/duplocloud//modules/eks-nodes"
  version      = "0.0.5"
  tenant_id    = local.tenant_id
  os_disk_size = var.asg_os_disk_size
  eks_version  = data.duplocloud_plan.plan.kubernetes_config[0]["version"]

  az_list            = var.az_list
  capacity           = var.asg_instance_type
  instance_count     = var.asg_instance_count
  min_instance_count = var.asg_instance_count
  max_instance_count = var.asg_instance_count
}
