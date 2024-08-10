variable "instance_type" {
  type        = string
  description = "this var for instanncetype"
  validation {
    condition     = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    error_message = "like only t2.micro or t3.micro"

  }
}