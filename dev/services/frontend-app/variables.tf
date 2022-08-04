variable "server_port" {
  description = "The port of the server will use for HTTP requests"
  default = 8080
  type = number
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-052efd3df9dad4825"
}

variable "region" {
  default = "us-east-2"
}

variable "environment" {
  default = "dev"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type = list(string)
  default = [ "10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "private_subnets_cidr" {
  type = list(string)
  default = [ "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24" ]
}

variable "availability_zones" {
  type = list(string)
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}
