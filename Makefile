.PHONY: all cluster clean destroy image infra reset softreset

all: prepare image infra cluster charts

charts:
	.venv/bin/ansible-playbook -i inventory/inventory.cfg charts.yml

cluster: 
	.venv/bin/ansible-playbook -i inventory/inventory.cfg site.yml

clean: destroy
	rm -rf .venv build

nuke:
	$(MAKE) $(MFLAGS) -C "./infra" destroy

image:
	$(MAKE) $(MFLAGS) -C "./image" debian

infra:
	$(MAKE) $(MFLAGS) -C "./infra" cluster

prepare:
	python3 -m venv .venv
	.venv/bin/pip install --upgrade pip wheel
	.venv/bin/pip install --requirement requirements.txt
	.venv/bin/ansible-galaxy collection install --requirements-file requirements.yml

reset: nuke infra cluster

softreset:
	.venv/bin/ansible-playbook -i inventory/inventory.cfg reset.yml
	$(MAKE) $(MFLAGS) cluster

