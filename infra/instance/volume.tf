resource "libvirt_volume" "volume" {
  base_volume_id = var.base_volume.id
  name           = "${var.name}.${var.domain}"
  pool           = var.pool
  size           = var.disk_size
}

