output "PrintUser" {
    //value = "hello ${var.Users[0]}"

    value = "${join("--->",var.Users)}"
}


output "hello" {
  value ="${upper(join("--->",var.Users))}"
}
output "hellolower" {
  value ="${lower(var.Users[2])}"
}
output "hellotitle" {
  value ="${title(join("--->",var.Users))}"
}

// ["sai","raghu","ram"]  input should be like this

// terraform plan -var 'Users =  ["sai","raghu","ram"]'    thru command line

// ""${join("separator",variable)}"
