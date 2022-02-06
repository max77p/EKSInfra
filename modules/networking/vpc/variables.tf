# variable "cidr" {
#   description = "VPC cidr block. Example: 10.0.0.0/16"
# }

variable "tags" {
  type        = map
  description = "Map of Default Tags"
}

variable "vpc_cidr" {
  type = string
}

variable "enable_dns_hostnames" {
  type = bool
}