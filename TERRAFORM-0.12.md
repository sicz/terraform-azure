# Terraform 0.12

* [Terraform 0.12 Preview](https://www.hashicorp.com/blog/terraform-0-1-2-preview)
* [Terraform 0.12 GitHub Milestone](https://github.com/hashicorp/terraform/milestone/5)
* [Upgrading to Terraform v0.12](https://www.terraform.io/upgrade-guides/0-12.html)

## Installation

Use [chtf](https://github.com/Yleisradio/homebrew-terraforms) to install
multiple Terraform versions and switch between them:
```bash
export TF_VERSION="0.12.0-alpha4"
# Install Terraform 0.12
brew tap Yleisradio/terraforms
brew install chtf
source /usr/local/share/chtf/chtf.sh
# Switch to Terraform 0.12
chtf ${TF_VERSION}
# Switch back to the system Terraform (installed with `brew install terraform`).
chtf system
# List of Terraform versions installed with chtf
chtf
```

## Providers

Terraform 0.12 is shipped with the following providers:
* terraform-provider-aws
* terraform-provider-azurerm
* terraform-provider-google
* terraform-provider-local
* terraform-provider-null
* terraform-provider-oci
* terraform-provider-random
* terraform-provider-template

If you need to use other providers, you need to compile them
(see [this comment on Terraform #19221 issue](https://github.com/hashicorp/terraform/issues/19221#issuecomment-445962957)):
```bash
export GOPATH="~/go"
export TF_VERSION="0.12.0-alpha4"
export TF_PROVIDER="terraform-provider-external"
brew install go govendor
mkdir -p $GOPATH/src/github.com/terraform-providers
cd $GOPATH/src/github.com/terraform-providers
git clone https://github.com/terraform-providers/${TF_PROVIDER}.git
cd ${TF_PROVIDER}
rm -rf vendor
govendor init
govendor fetch github.com/hashicorp/terraform/...@=v${TF_VERSION}
govendor fetch +m
go build
mkdir -p ~/.terraform.d/plugins
mv ${TF_PROVIDER} ~/.terraform.d/plugins
```

## Examples

* [Terraform Private Registry for AWS](https://github.com/apparentlymart/terraform-aws-tf-registry/)
