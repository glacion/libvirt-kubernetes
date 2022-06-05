resource "libvirt_network" "network" {
  addresses = var.addresses
  autostart = true
  domain    = var.domain
  mode      = "nat"
  name      = var.domain

  dns {
    enabled = true
  }

  dnsmasq_options {
    options {
      option_name  = "address"
      option_value = "/controller.${var.domain}/${var.controller_vip}"
    }

    options {
      option_name  = "address"
      option_value = "/worker.${var.domain}/${var.worker_vip}"
    }

    options {
      option_name  = "cname"
      option_value = "*.worker.${var.domain},worker.${var.domain}"
    }
  }
}
