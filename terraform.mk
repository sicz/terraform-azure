TF_DEPENDENCIES	+= $(shell ls *.tf *.tf.json *.tfvars 2>/dev/null)

tf-init .terraform: $(TF_DEPENDENCIES)
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@terraform init $(TF_INIT_OPTS)

tf-plan: .terraform
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@terraform plan $(TF_PLAN_OPTS)

tf-apply terraform.tfstate: .terraform
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@terraform apply $(TF_APLLY_OPTS)

tf-output: terraform.tfstate
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@terraform output $(TF_OUTPUT_OPTS)

tf-destroy:
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@[ ! -f terraform.tfstate ] || terraform destroy $(TF_DESTROY_OPTS)
	@rm -f terraform.tfstate

tf-forget:
	[ -f terraform.tfstate ] && mv -fv terraform.tfstate terraform.tfstate.backup

tf-clean:
	rm -fv *.tfstate *.tfstate.*
	rm -frv .terraform
