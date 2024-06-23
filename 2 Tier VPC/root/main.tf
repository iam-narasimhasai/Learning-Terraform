module "vpc" {
  source         = "../modules/vpc"
  vpc_cidr       = var.vpc_cidr
  pubsub_1a_cidr = var.pubsub_1a_cidr
  pubsub_2a_cidr = var.pubsub_2a_cidr
  prisub_1a_cidr = var.prisub_1a_cidr
  prisub_2a_cidr = var.prisub_2a_cidr
  prisub_3a_cidr = var.prisub_3a_cidr
  prisub_4a_cidr = var.prisub_4a_cidr
  
}


