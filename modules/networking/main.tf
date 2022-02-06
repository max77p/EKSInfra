module "vpc" {
  source = "./vpc"

  tags   = var.tags
  vpc_cidr = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
}

module "private_subnet" {
  source = "./subnet"

  vpc_id = module.vpc.vpc_id
  cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
  tags   = var.tags
}

# module "public_subnet" {
#   source = "./subnet"

#   name               = "${var.app}_${var.environment}_public_subnet"
#   environment        = var.environment
#   app         = var.app
#   vpc_id             = module.vpc.id
#   cidrs              = var.public_subnet_cidrs
#   availability_zones = var.availability_zones
# }

# module "nat" {
#   source = "./nat_gateway"

#   subnet_ids   = module.public_subnet.ids
#   subnet_count = length(var.public_subnet_cidrs)
# }

# resource "aws_route" "public_igw_route" {
#   count                  = length(var.public_subnet_cidrs)
#   route_table_id         = element(module.public_subnet.route_table_ids, count.index)
#   gateway_id             = module.vpc.igw
#   destination_cidr_block = var.destination_cidr_block
# }

# resource "aws_route" "private_nat_route" {
#   count                  = length(var.private_subnet_cidrs)
#   route_table_id         = element(module.private_subnet.route_table_ids, count.index)
#   nat_gateway_id         = element(module.nat.ids, count.index)
#   destination_cidr_block = var.destination_cidr_block
# }

# # Creating a NAT Gateway takes some time. Some services need the internet (NAT Gateway) before proceeding. 
# # Therefore we need a way to depend on the NAT Gateway in Terraform and wait until is finished. 
# # Currently Terraform does not allow module dependency to wait on.
# # Therefore we use a workaround described here: https://github.com/hashicorp/terraform/issues/1178#issuecomment-207369534

# resource "null_resource" "dummy_dependency" {
#   depends_on = [module.nat]
# }

# # ---------------------------------------------------------------------------------------------------------
# resource "aws_db_subnet_group" "docclik_rds" {
#   name       = "docck-rds"
#   subnet_ids = module.private_subnet.ids

#   tags = {
#     Name = "docclik"
#   }
# }