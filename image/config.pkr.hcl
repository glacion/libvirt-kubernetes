locals {
  build_root = "../build/bullseye"
  build_path = "${local.build_root}/${local.date}"
  date       = timestamp()
}

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
  disk_image   = true
  disk_size    = "4G"
  format       = "qcow2"
  iso_checksum = "file:https://cloud.debian.org/images/cloud/bullseye/latest/SHA512SUMS"
  iso_url      = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2"

  accelerator = "kvm"
  headless    = true

  output_directory = local.build_path
  vm_name          = "debian.qcow2"

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
    command       = "../.venv/bin/ansible-playbook"
    playbook_file = "site.yml"
    use_proxy     = false
    user          = "debian"
  }

  post-processor "manifest" {
    output     = "${local.build_path}/manifest.json"
    strip_path = true
  }

  post-processor "shell-local" {
    inline = [
      "rm -v \"$(realpath -s ${local.build_root}/latest)\" || true",
      "ln -sv \"$(realpath -s ${local.build_path})\" \"$(realpath -s ${local.build_root})/latest\"",
    ]
  }
}
