data "terraform_remote_state" "db"{
    backend = "s3"

    config = {
        bucket = "sisoitherembo-terraform-state-bucket"
        key = "dev/data-storage/terraform.tfstate"
        region = "us-east-2" 
    }
}

data "template_file" "user_date"{
    template = file("user-data.sh")

    vars = {
        server_port = var.server_port
        db_address = data.terraform_remote_state.db.outputs.MySQL_address
        db_port = data.terraform_remote_state.db.outputs.MySQL_port
    }
}


data "aws_ami" "latest_amazon_linux"{
    owners = [ "amazon" ]
    most_recent = true
    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}