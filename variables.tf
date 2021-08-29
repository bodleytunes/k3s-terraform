variable "infra_env" {
  type = string
  description = "production environment"
  default = "prod"
}

variable "project" {
  type = string
  description = "project"
  default = "k3s"
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
    0 = {
      id = 0
      name = "master0"
      az = "eu-west-3a"
      cidr = "10.100.0.0/24"
    },
    1 = {
      id = 1
      name = "master1"
      az = "eu-west-3b"
      cidr = "10.100.1.0/24"
    },
    2 = {
      id = 2
      name = "master2"
      az = "eu-west-3c"
      cidr = "10.100.2.0/24"
    },
  }
}
variable "worker_subnets" {
  default = {
    3 = {
      id = 0
      name = "worker0"
      az = "eu-west-3a"
      cidr = "10.100.10.0/24"
    },
    4 = {
      id = 1
      name = "worker2"
      az = "eu-west-3b"
      cidr = "10.100.11.0/24"
    },
    5 = {
      id = 2
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

variable "k3s_ingress_rules" {
  default = {
    "vxlan" = {
      name = "vxlan"
      from_port = 4789
      to_port = 4789
      protocol = "tcp"
      cidr_blocks = ["10.100.0.0/16"]
    },
    "wireguard" = {
      name = "wireguard"
      from_port = 51820
      to_port = 51820
      protocol = "udp"
      cidr_blocks = ["10.100.0.0/16"]
    }
  }
}
