variable "infra_env" {
  type        = string
  description = "prod"
}
 
variable "vpc_cidr" {
  type        = string
  description = "The IP range to use for the VPC"
  default     = "10.0.0.0/16"
}
 
variable "azs" {
  type = list(string)
  description = "AZs to create subnets into"
}
 
variable "master_subnets" {
  type = list(string)
  description = "subnets to create for master nodes network traffic, one per AZ"
}
 
variable "worker_subnets" {
  type = list(string)
  description = "subnets to create for worker nodes network traffic, one per AZ"
}

variable "internet_subnet" {
  type = string
  description = "subnets to create for worker nodes network traffic, one per AZ"
}