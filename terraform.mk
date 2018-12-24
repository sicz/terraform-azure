TF_VERSION	= 0.12.0-alpha4
TF_COMMAND	= /usr/local/Caskroom/terraform-$(TF_VERSION)/$(TF_VERSION)/terraform
TF_DEPENDENCIES	+= $(shell ls *.tf *.tf.json *.tfvars 2>/dev/null)

tf-init .terraform: $(TF_COMMAND) $(TF_DEPENDENCIES)
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@$(TF_COMMAND) init $(TF_INIT_OPTS)

tf-plan: .terraform
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@$(TF_COMMAND) plan $(TF_PLAN_OPTS)

tf-apply terraform.tfstate: .terraform
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@$(TF_COMMAND) apply $(TF_APLLY_OPTS)

tf-output: terraform.tfstate
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@$(TF_COMMAND) output $(TF_OUTPUT_OPTS)

tf-destroy:
	@az account get-access-token $(AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS) >/dev/null
	@[ ! -f terraform.tfstate ] || terraform destroy $(TF_DESTROY_OPTS)
	@rm -f terraform.tfstate

tf-forget:
	[ -f terraform.tfstate ] && mv -fv terraform.tfstate terraform.tfstate.backup

tf-clean:
	rm -fv *.tfstate *.tfstate.*
	rm -frv .terraform

$(TF_COMMAND):
	@source /usr/local/share/chtf/chtf.sh; chtf $(TF_VERSION)
