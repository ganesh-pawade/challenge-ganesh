
resource "google_compute_address" "address" {
  count  = 2
  name   = "cloud-nat-gw-ext-ip-${count.index}"
  region = var.region
}

resource "google_compute_router" "router" {
  name    = "${var.vpc_name}-nat-router"
  region  = var.region
  network = var.vpc_name
}

module "cloud-nat" {
  source                             = "../../../../../modules/networking/nat_gateway"
  
  project_id                         = var.project_id
  region                             = var.region
  router                             = google_compute_router.router.name
  name                               = "${var.vpc_name}-nat-gw"
  nat_ips                            = google_compute_address.address.*.self_link
  min_ports_per_vm                   = "128"
  icmp_idle_timeout_sec              = "15"
  tcp_established_idle_timeout_sec   = "600"
  tcp_transitory_idle_timeout_sec    = "15"
  udp_idle_timeout_sec               = "15"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
