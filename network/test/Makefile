include $(CURDIR)/../../terraform.mk

init: tf-init

plan: tf-plan

provision: tf-init
	@[ ! -f terraform.state ] && $(MAKE) tf-apply TF_APPLY_OPTS=-target=module.phase1 || true
	@$(MAKE) tf-apply

apply: tf-apply

output: tf-output

destroy: tf-destroy

forget: tf-forget

clean: tf-clean
