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

terraform refresh      - will query the providers to fetch the current state of your resources and update its state file accordingly(if something was changed in resource then it will be updated in tfstate file)

terraform show       -  The command will display the Terraform state in a readable format, showing details about the resources, their attributes, and their current values.

terraform output  - command is used to retrieve the values of output variables defined in your Terraform configuration. 


terraform console   - command allows you to open an interactive console to evaluate expressions and test functions within the context of your Terraform configuration .To go out from this command use "exit"

terraform console ⏎
>var.username
sai
>var.age
23

terraform fmt   -   command is to automatically format and style your Terraform configuration files



terraform plan -out    - command is used to generate an execution plan and save it to a binary file
terraform plan -out=my-plan.tfplan
terraform apply my-plan.tfplan

ssh-keygen -t rsa   - command to create rsa shh keys

vault server -dev -dev-listen-address="0.0.0.0:8200"   - to run vault server in dev mode on localhost port 8200

