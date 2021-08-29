variable "laptop_key" {
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFFJnwBV704MYn2pgQKPbzIuW8PJmy3NZNX1TXfOnAqM super@DESKTOP-U8L96OL"
}

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
      description = "vxlan"
    },
    "udp8472" = {
      name = "udp8472"
      from_port = 8472
      to_port = 8472
      protocol = "udp"
      cidr_blocks = ["10.100.0.0/16"]
      description = "udp8472"
    },
      "tcp8000" = {
      name = "tcp8000"
      from_port = 8000
      to_port = 8000
      protocol = "tcp"
      cidr_blocks = ["10.100.0.0/16"]
      description = "tcp8000"
    },
        "tcp9000" = {
      name = "tcp9000"
      from_port = 9000
      to_port = 9000
      protocol = "tcp"
      cidr_blocks = ["10.100.0.0/16"]
      description = "tcp9000"
    },
        "etcd" = {
      name = "etcd"
      from_port = 2379
      to_port = 2380
      protocol = "tcp"
      cidr_blocks = ["10.100.0.0/16"]
      description = "etcd"
    },
        "tcp6443" = {
      name = "tcp6443"
      from_port = 6443
      to_port = 6443
      protocol = "tcp"
      cidr_blocks = ["10.100.0.0/16"]
      description = "tcp6443"

    },
        "tcp2381" = {
      name = "tcp2381"
      from_port = 2381
      to_port = 2381
      protocol = "tcp"
      cidr_blocks = ["10.100.0.0/16"]
      description = "tcp 2381"

    },
    "bgp" = {
      name = "bgp"
      from_port = 179
      to_port = 179
      protocol = "tcp"
      cidr_blocks = ["10.100.0.0/16"]
      description = "BGP"
    },
        "ip_in_ip" = {
      name = "ip_in_ip"
      from_port = 0
      to_port = 0
      protocol = "4"
      cidr_blocks = ["10.100.0.0/16"]
      description = "IP in IP"
    }  
  }
}
