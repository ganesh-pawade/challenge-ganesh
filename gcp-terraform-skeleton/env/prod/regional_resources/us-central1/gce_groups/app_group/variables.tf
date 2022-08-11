########
#Global#
########
variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "region" {
  type        = string
  description = "Region where the instance template and instance should be created."
}

##########
#Instance#
##########
variable "machine_type" {
  description = "Machine type to create, e.g. e2-standard-1"
}

###################
#Network-Interface#
###################
variable "network" {
  default     = ""
}

variable "subnetwork" {
  default     = ""
}

variable "network_tags" {
  description = "Network tags, provided as a list"
}

###########
#Disk Info#
###########
variable "boot_disk0_info" {
  description = "The information of boot disk of GCE instance."
}

variable "disk_snapshot_policy_name" {
  description = "The name of snapshot policy name for boot and additional disk of GCE instance."
}

########
#Labels#
########
variable "instance_labels" {
  type        = map(string)
  description = "Instance Labels, provided as a map"
  default     = {}
}

variable "disk_labels" {
  type        = map(string)
  description = "Disk Labels, provided as a map"
  default     = {}
}

#################
#Service Account#
#################
variable "service_account" {
  type = object({
    email  = string
    scopes = set(string)
  })
  description = "Service account to attach to the instance"
}

variable "ssh_keys" {
  default = {}
}
