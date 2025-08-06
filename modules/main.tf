module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source = "./modules/ec2"

  security_group_id = module.vpc.security_group_id  
  instance_type     = "t2.micro"                    
  key_name          = "Deep-Kumar"              
}
