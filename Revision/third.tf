# output "printname" {
#   value = "${var.users[0]} Hello ${var.username} , ${var.system} ,${var.age}"
# }

# output "Userslist" {
#   value = "${upper(join("-->",var.users))}"
# }


# output "userage" {
#   value = "my name is ${var.user} is ${lookup(var.age, "${var.user}")} "
# }




#  output "userages" {  //simple
#    value = "name is ${var.user} age is ${lookup(var.age, var.user)}"
#  }



 output "userage" {
   value = "${var.age} ${var.username}"
 }
















