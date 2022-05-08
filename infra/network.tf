resource "libvirt_network" "network" {
  addresses = var.addresses
  autostart = true
  domain    = var.domain
  mode      = "nat"
  name      = var.domain

  dns {
    enabled = true
  }
}
