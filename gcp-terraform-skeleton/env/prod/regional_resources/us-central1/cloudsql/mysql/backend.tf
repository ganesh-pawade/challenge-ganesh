terraform {
  backend "gcs" {
    bucket = "prod-${var.project_id}-tfstate-${var.region}-gcs"
    prefix = "prod/regions/us-central1/cloudsql/mysql/cluster-abc"
  }
}
