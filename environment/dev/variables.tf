variable "location" {
    type = string
    default = "ca-central-1"
}

variable "tags" {
  type        = map
  description = "Map of Default Tags"
  default     = {
        Name = "EKSInfra"
        Environment = "Dev"
        Owner = "Shan"
        Managed_by = "Terraform"
    }
}

variable "vpc_cidr" {
 default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
    type = bool
    default = true
}
# variable "network_resource_group_name" {
#     type = string
#     default = "network"
# }