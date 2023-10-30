# Learning-Terraform

# Terraform commands

terraform plan - command to see what changes Terraform will apply to your infrastructure. This command does not make any actual changes; it only shows you the expected changes.

terraform providers - shows information about the provider requirements of the configuration in the current working directory


terraform init - command to initialize a Terraform configuration directory

terraform apply -  command used to apply the changes defined in your Terraform configuration to your infrastructure. 

terraform apply --auto-approve

terraform statefile(its not a command) -  It is used to store and manage the state of the infrastructure you are managing with Terraform. 

terraform destroy  - is a command that is used to destroy the infrastructure resources created and managed by Terraform based on your configuration. It's essentially the reverse of terraform apply, which creates or updates resources. 

terraform destroy --target resourcetype.resourcelocalname - It is used to delete selected resource 

terraform destroy --target github_repository.secondexample 

terraform validate   - used to check the syntax and configuration of your Terraform files. It performs a static analysis of your configuration files to ensure that they are well-formed and do not contain syntax errors or references to non-existent resources or providers.
