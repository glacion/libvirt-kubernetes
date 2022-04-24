resource "libvirt_domain" "debian" {
  name     = "debian"
  memory   = "2048"
  vcpu     = 2

  /* cpu { */
  /*   mode = "host-passthrough" */
  /* } */

  cloudinit = libvirt_cloudinit_disk.init.id

  disk {
    volume_id = libvirt_volume.debian.id
  }

  network_interface {
    network_id = libvirt_network.network.id
    hostname   = "debian"
    addresses = [
      "10.17.3.3",
    ]
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
