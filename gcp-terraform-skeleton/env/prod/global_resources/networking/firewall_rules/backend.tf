// file: backend.tf

terraform {
  backend "gcs" {
    bucket = "prod-${var.project_id}-tfstate-${var.region}-gcs"
    prefix = "prod/global/networking/firewall_rules"
  }
}
