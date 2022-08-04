terraform {
  backend "s3" {
    bucket = "sisoitherembo-terraform-state-bucket"
    key = "dev/services/frontend-app/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "sisoitherembo-terraform-state-bucket-locks"
    encrypt = true
  }
}

module "networking" {
  source = "../../../modules/networking"

  environment          = "${var.environment}"
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnets_cidr  = "${var.public_subnets_cidr}"
  private_subnets_cidr = "${var.private_subnets_cidr}"
  availability_zones   = "${var.availability_zones}"
}

provider "aws" {
  region = var.region
}


resource "aws_instance" "private_server" {
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ module.networking.security_group_id ]
  subnet_id =  module.networking.private_subnet_id 

  depends_on = [
    module.networking
  ]

  user_data = data.template_file.user_date.rendered

  tags = {
    "Name" = "private_server_terraform"
  }
}


resource "aws_instance" "bastion_server" {
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ module.networking.security_group_id ]
  subnet_id =  module.networking.public_subnet_id 
  
  depends_on = [
    module.networking
  ]

  user_data = data.template_file.user_date.rendered

  tags = {
    "Name" = "bastion_server_terraform"
  }
}
