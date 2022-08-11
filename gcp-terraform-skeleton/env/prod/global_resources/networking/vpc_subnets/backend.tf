terraform {
  backend "gcs" {
    bucket = "prod-${var.project_id}-tfstate-${var.region}-gcs"
    prefix = "prod/global/networking/vpc_subnets"
  }
}
