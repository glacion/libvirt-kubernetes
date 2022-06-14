resource "libvirt_network" "network" {
  addresses = var.addresses
  autostart = true
  domain    = var.domain
  mode      = "nat"
  name      = var.domain

  dns {
    enabled = true

    hosts {
      hostname = "controller.${var.domain}"
      ip       = var.controller_vip
    }
  }
}
