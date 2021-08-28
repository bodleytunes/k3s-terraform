variable "infra_env" {
  type = string
  description = "production environment"
  default = "prod"
}

variable "prod_env" {
  type = string
  description = "production environment"
  default = "prod"
}

variable default_region {
  type = string
  default = "eu-west-3"
  description = "The default region"
}

variable aws_region {
  type = string
  default = "eu-west-3"
  description = "aws_region"
}


###
# VPC resources
##
 
variable vpc_cidr {
  type = string
  default = "10.100.0.0/16"

}

variable azs {
  type = list
  default = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
}


variable "master_subnets" {
  default = {
    "master0" = {
      name = "master0"
      az = "eu-west-3a"
      cidr = "10.100.0.0/24"
    },
    "master1" = {
      name = "master1"
      az = "eu-west-3b"
      cidr = "10.100.1.0/24"
    },
    "master2" = {
      name = "master2"
      az = "eu-west-3c"
      cidr = "10.100.2.0/24"
    },
  }
}
variable worker_subnets{
  default = {
    "worker0" = {
      name = "worker0"
      az = "eu-west-3a"
      cidr = "10.100.10.0/24"
    },
    "worker2" = {
      name = "worker2"
      az = "eu-west-3b"
      cidr = "10.100.11.0/24"
    },
    "worker3" = {
      name = "worker3"
      az = "eu-west-3c"
      cidr = "10.100.12.0/24"
    }
  }
}


variable "ami_image" {
  type = string
  default = "ami-0953b38f670ad3e1e"
}

variable "master_instance_type" {
  type = string
  default = "t2.medium"
}

variable "worker_instance_type" {
  type = string
  default = "t2.micro"
}

variable "master_root_volume_type" {
  type = string
  default = "gp2"
}

variable "master_root_volume_size" {
  type = number
  default = 8
}

variable "worker_root_volume_type" {
  type = string
  default = "gp2"
}

variable "worker_root_volume_size" {
  type = number
  default = 8
}