/******************************************
	GCP HTTP LB
 *****************************************/
 module "http_lb" {
  source                = "../../../../../../modules/networking/cloud_lb/http_lb"

  name              = "group-http-lb"
  project           = "my-project-id"
  target_tags       = [module.mig1.target_tags, module.mig2.target_tags]
  backends = {
    default = {
      description                     = null
      protocol                        = "HTTP"
      port                            = var.service_port
      port_name                       = var.service_port_name
      timeout_sec                     = 10
      connection_draining_timeout_sec = null
      enable_cdn                      = false
      session_affinity                = null
      affinity_cookie_ttl_sec         = null

      health_check = {
        check_interval_sec  = null
        timeout_sec         = null
        healthy_threshold   = null
        unhealthy_threshold = null
        request_path        = "/"
        port                = var.service_port
        host                = null
        logging             = null
      }

      log_config = {
        enable = true
        sample_rate = 1.0
      }

      groups = [
        {
          # Each node pool instance group should be added to the backend.
          group                        = var.backend
          balancing_mode               = null
          capacity_scaler              = null
          description                  = null
          max_connections              = null
          max_connections_per_instance = null
          max_connections_per_endpoint = null
          max_rate                     = null
          max_rate_per_instance        = null
          max_rate_per_endpoint        = null
          max_utilization              = null
        },
      ]
    }
  }
}
