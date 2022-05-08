resource "libvirt_domain" "domain" {
  name       = local.fqdn
  memory     = var.memory
  vcpu       = var.cpu
  cloudinit  = libvirt_cloudinit_disk.init.id
  qemu_agent = true

  cpu {
    mode = "host-passthrough"
  }

  disk {
    volume_id = var.base_volume.id
  }

  network_interface {
    network_id     = var.network.id
    hostname       = local.fqdn
    wait_for_lease = true
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }
  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
