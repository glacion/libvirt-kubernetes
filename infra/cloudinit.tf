resource "libvirt_cloudinit_disk" "init" {
  name      = "commoninit.iso"
  user_data = file("${path.module}/cloud-init.yml")
	meta_data = jsonencode({
		instance-id    = "fkjdkjfajksdlfjkasjd"
		local-hostname = "master.glacion.com"
	}) 
}

