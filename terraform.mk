TF_DEPENDENCIES	+= $(shell ls *.tf *.tf.json *.tfvars 2>/dev/null)

init .terraform: $(TF_DEPENDENCIES)
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@terraform init $(TF_INIT_OPTS)

plan: .terraform
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@terraform plan $(TF_PLAN_OPTS)

apply terraform.tfstate: .terraform
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@terraform apply $(TF_APLLY_OPTS)

output: terraform.tfstate
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@terraform output $(TF_OUTPUT_OPTS)

destroy:
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@[ ! -f terraform.tfstate ] || terraform destroy $(TF_DESTROY_OPTS)
	@rm -f terraform.tfstate

clean:
	rm -fv terraform.tfstate

distclean:
	rm -fv *.tfstate *.tfstate.*
	rm -frv .terraform

clobber: destroy distclean
