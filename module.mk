TF_DEPENDECIES	+= *.tf *.tf.json *.tfvars

get-access-token:
	@az account get-access-token ${AZ_ACCOUNT_GET_ACCESS_TOKEN_OPTS}> /dev/null

init .terraform: get-access-token $(TF_DEPENDECIES)
	@terraform init ${TF_INIT_OPTS}

plan: .terraform
	@terraform plan ${TF_PLAN_OPTS}

apply terraform.tfstate: .terraform
	@terraform apply ${TF_APLLY_OPTS}

output: terraform.tfstate
	@terraform output ${TF_OUTPUT_OPTS}

destroy: get-access-token
	@[ ! -f terraform.tfstate ] || terraform destroy ${TF_DESTROY_OPTS}
	@rm -f terraform.tfstate

clean:
	rm -fv terraform.tfstate

distclean:
	rm -fv *.tfstate *.tfstate.*
	rm -frv .terraform

clobber: destroy distclean
