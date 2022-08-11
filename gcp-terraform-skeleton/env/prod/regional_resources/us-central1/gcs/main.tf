
module "gcs" {
  source            = "../../../../../modules/cloud_storage"
  project_id        = var.project_id
  location          = var.region
  name              = "prod-${var.project_id}-tfstate-${var.region}-gcs"
}
