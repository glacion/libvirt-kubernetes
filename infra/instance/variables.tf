locals {
  fqdn = "${var.name}.${var.domain}"
}

variable "base_volume" {
  type = object({
    id = string
  })
  description = "base volume"
  nullable    = false
}

variable "cpu" {
  type        = number
  description = "CPU count"
  nullable    = false
}

variable "disk_size" {
  type        = number
  description = "disk size in bytes"
  nullable    = false
}

variable "domain" {
  type        = string
  description = "domain of instance"
  nullable    = false
}

variable "labels" {
  type        = map(string)
  description = "misc. key-value labels"
  default     = {}
}

variable "memory" {
  type        = number
  description = "memory in MB"
  nullable    = false
}

variable "name" {
  type        = string
  description = "name of instance"
  nullable    = false
}

variable "network" {
  type = object({
    id = string
  })
  description = "network of instance"
  nullable    = false
}

variable "pool" {
  type        = string
  description = "libvirt volume pool name"
  nullable    = false
}

variable "ssh_keys" {
  type        = list(string)
  description = "ssh public keys"
}
