resource "libvirt_domain" "domain" {
  cloudinit  = libvirt_cloudinit_disk.init.id
  memory     = var.memory
  name       = local.fqdn
  qemu_agent = true
  vcpu       = var.cpu

  cpu {
    mode = "host-passthrough"
  }

  disk {
    volume_id = libvirt_volume.volume.id
  }

  network_interface {
    hostname       = local.fqdn
    network_id     = var.network.id
    wait_for_lease = true
    addresses = [
      var.address
    ]
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}
