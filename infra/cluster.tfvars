base_volume    = "../build/debian/latest/debian.qcow2"
controller_vip = "10.17.3.10"
domain         = "kubernetes.glacion.com"
libvirt_uri    = "qemu:///system"
pool           = "default"
ssh_username   = "glacion"

addresses = [
  "10.17.3.0/24"
]

instances = {
  controller01 = {
    address   = "10.17.3.11"
    cpu       = 2,
    disk_size = 64
    memory    = 2048
    labels = {
      group = "controller"
    }
  }
  controller02 = {
    address   = "10.17.3.12"
    cpu       = 2,
    disk_size = 64
    memory    = 2048
    labels = {
      group = "controller"
    }
  }
  controller03 = {
    address   = "10.17.3.13"
    cpu       = 2,
    disk_size = 64
    memory    = 2048
    labels = {
      group = "controller"
    }
  }
  worker01 = {
    address   = "10.17.3.21"
    cpu       = 4,
    disk_size = 64
    memory    = 4096
    labels = {
      group = "worker"
    }
  }
  worker02 = {
    address   = "10.17.3.22"
    cpu       = 4,
    disk_size = 64
    memory    = 4096
    labels = {
      group = "worker"
    }
  }
  worker03 = {
    address   = "10.17.3.23"
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
