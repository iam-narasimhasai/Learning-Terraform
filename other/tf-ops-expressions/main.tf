terraform {}

variable "listnum" {
  type    = list(number)
  default = [0, 1, 2, 3, 4]

}
variable "listobj" {
  type = list(object({
    name = string
    id   = number
  }))

  default = [{
    name = "sai"
    id   = 123
    },
    {
      name = "ramu"
      id   = 124
    }
  ]
}

variable "maplist" {
  type = map(string)

  /*default = {
 "one" = 1
 "two" = 2
 "three" = 3
}
*/
  default = {
    "name"    = "sai"
    "product" = "iphone"
  }
}

locals {
  a = 2 * 3
  b = 2 != 3

  double = [for i in var.listnum : i * 2]
  odd    = [for i in var.listnum : i if i % 2 != 0]

  //fname = [for i in var.listobj : i.name + "" + i.id]
  fname = [for i in var.listobj : "${i.name} ${i.id}"]
  //gname here printing key
  gname = [for key, value in var.maplist : key]
  //mapl is a map thats y we used {}
  mapl = { for key, value in var.maplist : key => value }

}

output "name" {
  value = join(" ", var.listnum)

}
