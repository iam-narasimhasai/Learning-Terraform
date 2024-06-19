# variable "akey" {
#   type = string
# }

# variable "skey" {
#   type = string
# }

variable "ports" {
  type = list(number)

}
variable "imageid" {
  type = string

}

variable "instance_type" {
  type = string
}
