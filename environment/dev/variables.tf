variable "location" {
  type    = string
  default = "ca-central-1"
}

variable "tags" {
  type        = map(any)
  description = "Map of Default Tags"
  default = {
    Name        = "EKSInfra"
    Environment = "Dev"
    Owner       = "Shan"
    Managed_by  = "Terraform"
  }
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# The IP ranges to use for the public subnets in your VPC.
# Must be within the IP range of your VPC.
# public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24"]

# The IP ranges to use for the private subnets in your VPC.
# Must be within the IP range of your VPC.
variable "private_subnet_cidrs" {
  default = ["10.0.50.0/24", "10.0.51.0/24"]
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

# The AWS availability zones to create subnets in.
# For high-availability, we need at least two.
variable "availability_zones" {
  default = ["ca-central-1a", "ca-central-1b"]
}
 