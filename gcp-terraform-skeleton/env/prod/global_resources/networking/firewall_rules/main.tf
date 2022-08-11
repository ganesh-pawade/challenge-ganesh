
module "bastion_host_ssh_rdp_fw_rule" {
  source = "../../../../../modules/networking/firewall"

  network       = var.vpc_name
  name          = "${var.vpc_name}-allow-bastion-host-ingress-fw"
  protocol      = "tcp"
  ports         = ["22"]
  source_ranges = [X.X.X.X]
  source_tags   = []
  target_tags   = ["bastion-host"] # Rule applies to only bastion-host instances in the network
}

  
module "app_group_fw_rule" {
  source = "../../../../../modules/networking/firewall"

  network       = var.vpc_name
  name          = "${var.vpc_name}-allow-app-group-fw"
  protocol      = "tcp"
  ports         = []
  source_ranges = ["10.1.1.0/24"] # change as per network requirement
  source_tags   = ["source-group"]
  target_tags   = ["app-group"]
}
