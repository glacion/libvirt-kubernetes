cluster:
	terraform init
	terraform apply -var-file=cluster.tfvars -auto-approve
	terraform output --raw inventory > ../inventory/inventory.cfg

destroy:
	terraform destroy -var-file=cluster.tfvars -auto-approve
	rm -vf ../inventory/inventory.cfg

clean:
	- rm -rfv .terraform* *.tfstate*
