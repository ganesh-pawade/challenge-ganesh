terraform {
  backend "gcs" {
    bucket = "prod-${var.project_id}-tfstate-${var.region}-gcs"
    prefix = "prod/regional/us-central1/gce_groups/app_group"
  }
}
