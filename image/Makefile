debian: prepare
	packer build -var-file=debian.pkrvars.hcl .

almalinux: prepare
	packer build -var-file=almalinux.pkrvars.hcl .

prepare:
	packer init .
