
variable "project_id" {
  type        = string
  description = "The project to setup cloudsql mysql on"
}

variable "vpc_network" {
  description = "Name of the VPC network to peer."
  type        = string
}

variable "region" {
  type        = string
  description = "The region to setup cloudsql mysql in"
}

variable "instance_name" {
  type        = string
  description = "The name of the cloudsql mysql instance"
}

variable "instance_type" {
  type        = string
  description = "The type of the cloudsql mysql instance"
}

variable "instance_primary_zone" {
  type        = string
  description = "The primary zone of the cloudsql mysql instance. (a,b,c)"
}

variable "availability_type" {
  type        = string
  description = "The availability_type of the cloudsql mysql instance. REGIONAL or ZONAL"
}

variable "disk_size" {
  description = "The disk size for the master instance"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}

variable "database_flags" {
  type        = list
  description = "The database_flags of the cloudsql mysql instance."
}

variable "user_labels" {
  type        = map
  description = "The user_labels of the cloudsql mysql instance."
}
