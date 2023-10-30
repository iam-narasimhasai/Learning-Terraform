variable "name" {
  type = string
}
variable "age" {
  type = number
}

output "Printf" {
  value = "Hello ,${var.name} , your age is ${var.age}"

}

//enter all the variables in terraform.tfvars so that it will read automatically

//terraform plan -var-file=dev.tfvars    if you want to read variables from different file