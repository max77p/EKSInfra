output "vpc" {
  value = aws_vpc.module_vpc.id
}

# output "cidr_block" {
#   value = aws_vpc.vpc.cidr_block
# }

output "igw" {
  value = aws_internet_gateway.module_internet_gateway.id
}
