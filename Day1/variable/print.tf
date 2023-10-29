//all variables can be placed in variable file 

output "printuser" {
  value = "Hi ${var.Username} , age ${var.Age}"
}          

//Pass variable value from command         :    terraform plan -var "Username = Sai"

//at a time two variables                  :    terraform plan -var "Username=sai" -var "Age=21" 