resource "libvirt_network" "network" {
  # the name used by libvirt
  name = "kubernetes"

  # mode can be: "nat" (default), "none", "route", "open", "bridge"
  mode = "nat"
  domain = "k8s.glacion.com"

  addresses = ["10.17.3.0/24", "acac:4747:4747:acac::/64"]

  # (Optional) DNS configuration
  dns {
    enabled = true
  }
}
