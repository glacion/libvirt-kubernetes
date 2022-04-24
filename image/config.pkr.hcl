packer {
  required_plugins {
    qemu = {
      version = ">= 1.0.3"
      source  = "github.com/hashicorp/qemu"
    }
    sshkey = {
      version = ">= 1.0.1"
      source  = "github.com/ivoronin/sshkey"
    }
  }
}

data "sshkey" "key" {}

source "qemu" "debian" {
  disk_image       = true
  disk_size        = "4G"
  format           = "qcow2"
  iso_checksum     = "file:https://cloud.debian.org/images/cloud/bullseye/latest/SHA512SUMS"
  iso_url          = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2"

  accelerator = "kvm"
  firmware    = "/usr/share/OVMF/OVMF_CODE.fd"
  headless    = true

  output_directory = "build"
  vm_name          = "debian"

  ssh_private_key_file = data.sshkey.key.private_key_path
  ssh_username         = "debian"

  cd_label = "cidata"
  cd_content = {
    "meta-data" = jsonencode({
      instance-id    = "packer"
      local-hostname = "packer"
    })
    "user-data" = templatefile("userdata.yml.pkrtpl", {
      "public_key" : data.sshkey.key.public_key
    })
  }
}

build {
  sources = [
    "source.qemu.debian"
  ]

  provisioner "ansible" {
    playbook_file = "site.yml"
    use_proxy     = false
    user          = "debian"
  }
}
