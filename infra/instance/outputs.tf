output "fqdn" {
  value       = local.fqdn
  description = "FQDN of the instance"
}

output "addresses" {
  value = libvirt_domain.domain.network_interface.0.addresses
}

output "labels" {
  value = var.labels
}
