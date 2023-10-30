variable "Usersage" {
  type = map
  default = {
    sai=23,
    gaurav=10,
    saurav=12
  }
}

output "Ageofgaurav" {
  value = "This is gaurav, ${lookup(var.Usersage,"gaurav")}"
}


output "Age" {
  value = "Hi my name is sai,my age is ${lookup(var.Usersage,"sai")}"
}