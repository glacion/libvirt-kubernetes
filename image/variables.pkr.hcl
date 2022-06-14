variable "build_root" {
  // root directory for build artifacts
  type    = string
  default = "../build"
}

variable "cpus" {
  // CPUs to assign to the VM
  type    = number
  default = 2
}

variable "disk_compression" {
  // Image virtual disk size
  type    = bool
  default = true
}

variable "disk_size" {
  // Image virtual disk size
  type    = string
  default = "8G"
}

variable "memory" {
  // MB of memory to assign to the VM
  type    = number
  default = 2048
}

variable "distribution" {
  // name of the distribution
  type = string
}

variable "username" {
  // username to use for ssh connection
  type = string
}

variable "iso_url" {
  // passed directly into https://www.packer.io/plugins/builders/qemu
  // example: https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2
  type = string
}

variable "iso_checksum" {
  // passed directly into https://www.packer.io/plugins/builders/qemu
  // uses https://github.com/hashicorp/go-getter#checksumming=
  // example: https://cloud.debian.org/images/cloud/bullseye/latest/SHA512SUMS
  type = string
}

locals {
  date       = timestamp()
  build_root = "${var.build_root}/${var.distribution}"
  build_path = "${local.build_root}/${local.date}"
}
