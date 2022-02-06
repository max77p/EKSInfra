resource "aws_vpc" "module_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = var.tags
}

resource "aws_internet_gateway" "module_internet_gateway" {
  vpc_id = aws_vpc.module_vpc.id

  tags = var.tags
}
