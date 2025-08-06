terraform {
  backend "s3" {
    bucket = "terraformstatedeepak"
    key = "s3://terraformstatedeepak/terrafromstatefile/"
    region = "us-east-1"
    dynamodb_table = "terraform-table-lock"
    encrypt = true
  }
}