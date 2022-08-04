terraform {
  backend "s3" {
    bucket = "sisoitherembo-terraform-state-bucket"
    key = "dev/data-storage/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "sisoitherembo-terraform-state-bucket-locks"
    encrypt = true
  }
}


provider "aws" {
  region = "us-east-2"
}


resource "aws_db_instance" "mysql_db" {
  identifier_prefix     = "terraform-up-and-running"
  engine                = "mysql"
  allocated_storage     = 10
  instance_class        = "db.t2.micro"
  multi_az = true

  name                  = "example_database"
  username              = "admin"
  password              = var.db_password
}