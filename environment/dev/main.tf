terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                  = var.location
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "shan"
  default_tags {
    tags = {
    }
  }
}


module "network" {
  # depends_on = [
  #   module.resource_group
  # ]
  source = "../../modules/networking"

  tags                 = var.tags
  vpc_cidr             = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

# module "resource_group" {
#   source = "../../modules/resource_groups"

#   network_resource_group_name = var.network_resource_group_name
#   location = var.location

# }