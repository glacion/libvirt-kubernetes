variable "addresses" {
  type        = list(string)
  description = "CIDRs for the network"
  nullable    = false
}

variable "base_volume" {
  type        = string
  description = "path to a cloud-init enabled qcow image, see https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume"
  nullable    = false
}

variable "domain" {
  type        = string
  description = "cluster domain"
  nullable    = false
}

variable "instances" {
  type = map(object({
    address   = string
    cpu       = number
    disk_size = number # in GiB
    memory    = number # in MB
    labels    = map(string)
  }))
  description = "cluster instances"
}

variable "libvirt_uri" {
  type        = string
  description = "libvirt connection URI"
  nullable    = false
}

variable "pool" {
  type        = string
  description = "libvirt pool to use for storage"
  default     = "default"
}

variable "ssh_keys" {
  type        = list(string)
  description = "ssh public keys"
}

variable "ssh_username" {
  type        = string
  description = "ssh username"
}
