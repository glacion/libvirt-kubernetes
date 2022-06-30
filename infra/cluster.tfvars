base_volume    = "../build/debian/latest/debian.qcow2"
controller_vip = "192.168.47.10"
domain         = "kubernetes.glacion.com"
libvirt_uri    = "qemu:///system"
pool           = "default"
ssh_username   = "glacion"

addresses = [
  "192.168.47.0/24"
]

instances = {
  controller01 = {
    address   = "192.168.47.11"
    cpu       = 2,
    disk_size = 64
    memory    = 2048
    labels = {
      group = "controller"
    }
  }
  controller02 = {
    address   = "192.168.47.12"
    cpu       = 2,
    disk_size = 64
    memory    = 2048
    labels = {
      group = "controller"
    }
  }
  controller03 = {
    address   = "192.168.47.13"
    cpu       = 2,
    disk_size = 64
    memory    = 2048
    labels = {
      group = "controller"
    }
  }
  worker01 = {
    address   = "192.168.47.21"
    cpu       = 4,
    disk_size = 64
    memory    = 4096
    labels = {
      group = "worker"
    }
  }
  worker02 = {
    address   = "192.168.47.22"
    cpu       = 4,
    disk_size = 64
    memory    = 4096
    labels = {
      group = "worker"
    }
  }
  worker03 = {
    address   = "192.168.47.23"
    cpu       = 4,
    disk_size = 64
    memory    = 4096
    labels = {
      group = "worker"
    }
  }
}

ssh_keys = [
  "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHbXlfKMbig2wGyuA9tPd1Skjh89tVZ8M98AgWwpNgaM glacion@glacion.com"
]
