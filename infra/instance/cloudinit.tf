resource "libvirt_cloudinit_disk" "init" {
  name = "cloudinit.${local.fqdn}"
  pool = var.pool

  meta_data = jsonencode({
    instance-id    = local.fqdn
    local-hostname = local.fqdn
  })
  user_data = templatefile("${path.module}/cloud-init.yml.tftpl", {
    ssh_keys = var.ssh_keys
  })
}
