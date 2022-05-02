resource "libvirt_volume" "root" {
  name   = "debian-master"
  /* source = "https://mirror.pkgbuild.com/images/latest/Arch-Linux-x86_64-cloudimg.qcow2" */
  source = "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2"
  /* source = "../image/build/debian" */
}

resource "libvirt_volume" "debian" {
  name           = "debian"
  size           = 30 * pow(1024, 3)
  base_volume_id = libvirt_volume.root.id
}

