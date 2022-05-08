resource "libvirt_volume" "base" {
  name   = "base.${var.domain}"
  pool   = var.pool
  source = var.base_volume
}
