terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47"
    }
  }
  backend "s3" {
    bucket = "fv-fiap-db"
    key    = "fiap-db-state.tfstate"
    region = "us-east-2"
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-east-2"
}



resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_name                = "fiapfastfood"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  username               = "postgres"
  password               = "rootroot"
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [aws_security_group.db.id]
}

output "IP_db" {
  value = aws_db_instance.default.address
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false # Se não for necessário

  tags = var.vpc_tags
}