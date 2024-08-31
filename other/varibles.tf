variable "instance_type" {
  type        = string
  description = "this var for instanncetype"
  validation {
    condition     = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    error_message = "like only t2.micro or t3.micro"

  }

}

variable "root_config" {
  type = object({
    volume_size = number
    volume_type = string
  })

  default = {
    volume_size = 8
    volume_type = "gp2"
  }
}

variable "instance_tags" {
  type = map(string)

  default = {
    env = "DEV"
  }
}