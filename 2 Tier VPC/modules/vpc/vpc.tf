
resource "aws_vpc" "twotiervpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

tags = {     
  Name = "twotiervpc"
}

}
