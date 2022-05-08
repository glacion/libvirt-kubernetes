base_volume = "../build/almalinux/latest/almalinux.qcow2"
domain      = "kubernetes.glacion.com"
libvirt_uri = "qemu:///system"
pool        = "default"

addresses = [
  "10.17.3.0/24"
]

instances = {
  controller01 = {
    cpu       = 2,
    disk_size = 64
    memory    = 2048
    labels = {
      group = "controller"
    }
  }
  controller02 = {
    cpu       = 2,
    disk_size = 64
    memory    = 2048
    labels = {
      group = "controller"
    }
  }
  controller03 = {
    cpu       = 2,
    disk_size = 64
    memory    = 2048
    labels = {
      group = "controller"
    }
  }
  worker01 = {
    cpu       = 4,
    disk_size = 64
    memory    = 4096
    labels = {
      group = "worker"
    }
  }
  worker02 = {
    cpu       = 4,
    disk_size = 64
    memory    = 4096
    labels = {
      group = "worker"
    }
  }
  worker03 = {
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
