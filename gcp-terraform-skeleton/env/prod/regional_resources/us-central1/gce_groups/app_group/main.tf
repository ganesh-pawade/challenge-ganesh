module "disk_policy_creation" {
  source = "../../../../../../modules/compute_engine/disk_snapshot_policy"

  /* global */
  policy_name      = var.disk_snapshot_policy_name
  utc_time         = "06:00"
  retention_days   = "15"
  storage_location = "us"
}

module "app_group_vm1" {
  source = "../../../../../../modules/compute_engine/linux_vm"

  /* global */
  project_id = var.project_id
  region     = var.region

  /* machine details */
  machine_name            = "prod-projectid-app-us-ct1-a-01"
  machine_type            = var.machine_type
  machine_zone            = "us-central1-a"
  instance_labels         = var.instance_labels
  vm_deletion_protect     = true
  instance_image_selflink = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20210928"

  /* network details */
  network            = var.network
  subnetwork         = var.subnetwork
  network_tags       = var.network_tags
  internal_ip        = "10.1.1.1"
  enable_external_ip = false

  /* disk details */
  boot_disk_info       = var.boot_disk0_info["app_vm01"]
  disk_labels          = var.disk_labels
  snapshot_policy_name = module.disk_policy_creation.policy_name

  /* service account */
  service_account = var.service_account
  metadata_startup_script = <<-EOF
  curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/?recursive=true" -H "Metadata-Flavor: Google" > /metadata.txt
  EOF
    
}
