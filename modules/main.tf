module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source = "./ec2"
  subnet_id = module.vpc.public_subnet_id
  security_group = module.vpc.security_group_id
}