module "instance" {
  for_each = var.instances

  source = "./instance"
  providers = {
    libvirt = libvirt
  }

  name = each.key

  cpu       = each.value.cpu
  disk_size = each.value.disk_size * pow(1024, 3)
  labels    = each.value.labels
  memory    = each.value.memory

  base_volume  = libvirt_volume.base
  domain       = var.domain
  network      = libvirt_network.network
  pool         = var.pool
  ssh_keys     = var.ssh_keys
  ssh_username = var.ssh_username
}


output "instances" {
  value = module.instance
}

output "inventory" {
  value = templatefile("${path.module}/inventory.cfg.tftpl", {
    instances    = module.instance
    groups       = toset([for _, value in module.instance : value.labels.group])
    ssh_username = var.ssh_username
  })
}
