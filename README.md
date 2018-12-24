# Terraform modules for Azure

**_WARNING: This is a work in progress. These modules require (not yet released)
[Terraform 0.12](TERRAFORM-0.12.md). For the moment, these modules remains EXPERIMENTAL._**

## Terraform modules

* [resource-group](resource-group/README.md) - Create an Azure Resource Group. Preserves
  the location and unattended tags of an existing resource group.
* [resource-group/lookup](resource-group/lookup/README.md) - Look up the location and tags of the existing
  Azure Resource Group.

## Reporting Issues

Issues can be reported by using [GitHub Issues](/../../issues). Full details on
how to report issues can be found in the [Contribution Guidelines](CONTRIBUTING.md).

## Contributing

Please read the [Contribution Guidelines](CONTRIBUTING.md), and ensure you are
signing all your commits with
[DCO sign-off](CONTRIBUTING.md#developer-certification-of-origin-dco).

### Download source code

Clone the GitHub repository into your working directory:
```bash
git clone https://github.com/sicz/terraform-azure
cd terraform-azure
```

### Install dependencies

**_Here is how to install [Terraform 0.12.0-alpha version](TERRAFORM-0.12.md)._**

On Apple macOS, install the [Homebrew](https://brew.sh) package manager and
the following packages:
```bash
brew install azure-cli
brew install jq
brew install pre-commit
brew install terraform
brew install terraform-docs
```
On other platforms, install the appropriate packages.

### Initialize Git hooks

Initialize Git pre-commit hooks:
```bash
make init
```

### Usage

Set up [Terraform access to Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure#set-up-terraform-access-to-azure).

In the root directory, use the following commands:
```bash
make init             # Initialize Git hooks
make pre-commit       # Run Git pre-commit checks manually
```

In the module's test directories, use the following commands:
```bash
make init             # Init Terraform
make plan             # Show Terraform plan
make apply            # Create resources in Azure
make output           # Show Terraform output variables
make destroy          # Destroy resources in Azure
make forget           # Remove Terraform state file
make clean            # Remove generated files
make distclean        # Destroy resources in Azure and remove generated files
```

## Authors

* [Petr Řehoř](https://github.com/prehor) - Initial work.

See also the list of [contributors](/../../contributors) who have participated
in this project.

## License

This project is licensed under the Apache License, Version 2.0 - see the
[LICENSE](LICENSE) file for details.
