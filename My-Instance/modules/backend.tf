terraform {
  backend "s3" {
    bucket = "terraformstatedeepak"
    key = "ec2-project/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-table-lock"
    encrypt = true
  }
}