provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
}

module "sg" {
  source      = "./sg"
  vpc_id      = module.vpc.vpc_id
}

module "ec2" {
  source            = "./ec2"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.sg.security_group_id
  instance_type = var.instance_type
  key_name = var.key_name
}