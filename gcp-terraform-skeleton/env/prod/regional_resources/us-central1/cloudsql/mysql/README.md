# Google Cloud SQL Mysql Module

This module makes it easy to create aCloud SQL Mysql instance, with root users.

Features : 
- Multi-Regional/Regional Cluster
- Backup configuration
- Add additional users

## Usage

Basic usage of this module is as follows:

* Google Cloud SQL Mysql

```hcl
module "mysql" {
  source           = "../../../../modules/cloudsql/mysql"
  name             = var.instance_name
  project_id       = var.project_id
  database_version = "MYSQL_5_7"
  region           = var.region

  // Master configurations
  tier                            = var.instance_type
  zone                            = var.instance_primary_zone
  availability_type               = var.availability_type
  disk_size                       = var.disk_size
  disk_type                       = var.disk_type
  maintenance_window_day          = 7
  maintenance_window_hour         = 12
  maintenance_window_update_track = "stable"

  database_flags = var.database_flags

  user_labels = var.user_labels

  ip_configuration      = {
    ipv4_enabled        = false
    require_ssl         = true
    private_network     = "projects//global/networks/prod-projectid-vpc"
    authorized_networks = []
  }

  backup_configuration = {
    enabled            = true
    binary_log_enabled = true
    start_time         = "00:00"
  }

  additional_users = var.additional_users
}
```


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
