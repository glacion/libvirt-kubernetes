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

source "qemu" "image" {
  disk_image   = true
  format       = "qcow2"
  iso_url      = var.iso_url
  iso_checksum = var.iso_checksum

  accelerator = "kvm"
  cpus        = 2
  headless    = true
  memory      = 2048

  output_directory = local.build_path
  vm_name          = "${var.distribution}.qcow2"

  shutdown_command     = "sudo systemctl poweroff"
  ssh_private_key_file = data.sshkey.key.private_key_path
  ssh_username         = var.username

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
    "source.qemu.image"
  ]

  provisioner "ansible" {
    command       = "../.venv/bin/ansible-playbook"
    playbook_file = "site.yml"
    use_proxy     = false
    user          = var.username
  }

  post-processor "shell-local" {
    inline = [
      "rm -v \"$(realpath -s ${local.build_root}/latest)\" || true",
      "ln -sv \"$(realpath -s ${local.build_path})\" \"$(realpath -s ${local.build_root})/latest\"",
    ]
  }
}
