cluster:
	terraform init
	terraform apply -var-file=cluster.tfvars -auto-approve
	terraform output --raw inventory > ../build/inventory.cfg

destroy:
	terraform destroy -var-file=cluster.tfvars -auto-approve
	rm -vf ../inventory.cfg

clean:
	- rm -rfv .terraform* *.tfstate*
