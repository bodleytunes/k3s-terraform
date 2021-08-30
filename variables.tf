variable "laptop_key" {
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFFJnwBV704MYn2pgQKPbzIuW8PJmy3NZNX1TXfOnAqM super@DESKTOP-U8L96OL"
}

variable "wizznet_aws_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDd0A7Bs+mWyGvAkolSOVsxw2hm2pefFnpIzDQDROhjfLKGNehgMLBHF/bHWpt1urUlxBh2Y5xM46iTnRlhPQp+zZ3pp1wAitE4GdfYxp2DUqgfzmMQxnNazpaX3wMZr5HXQ7lYTuuAXJT6JR3mOz3BtKK8JqMD77wm2ek+fLzy2VG4/FJ5ipejYtvpgOCHzZGQoXACDobi2N8Rsit1Kl6DWI1/SLqwaEfcbfRB8jimE6PrYrjBTqHPxnDHvzvKrmaG4X+qXYyz7f7r6BNlZN8MFQ5k9hN1mCyldtsz6FfOgpTgiMV+bM+3FCH21LkRQvCcfe6TdF5FRwV54S3WLpNTK5U+p0e3aAGL7WRUHLb3DXOLKNqU0CUe+jbEgROS1nFV/NTRdXg0nYIPptj/yhfmvuH199dXoTgDcxXLTw2RSN4EK7Mn/QnukQ5EqVKzVd/MRArDBZeCC0LKyd6vunV0qvLm9IZKSa22Vi2Y/7zCEkN7R9hVnDHoAmHZGXmEj6k9NVZGr4h07YRU1G7CLnhesxZDUIDLXZPOt9SO8fgXgaZFdV/SWkNuChB/ZFDVCn94Z/adaKU4PKB+a1wrO7vhna8yVvJg6TbNy1FtnpvP0cGVxMph/9AkpkHb2oPd5z54Rgg+kXCqq+7pstKFEap+sYJvS4jsnGUTEoWPH0qG/w=="
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

variable "master_instances" {
  default = {
    master0 = {
      id = 0
      name = "master0"
      az = "eu-west-3a"
      ip_address = "10.100.0.10"
    },
    master1 = {
      id = 1
      az = "eu-west-3b"
      name = "master1"
      ip_address = "10.100.1.10"
    },
    master2 = {
      id = 2
      az = "eu-west-3c"
      name = "master2"
      ip_address = "10.100.2.10"    
      },
  }
}

variable "worker_instances" {
  default = {
    worker0 = {
      id = 0
      name = "worker0"
      az = "eu-west-3a"
      ip_address = "10.100.10.10"
    },
    worker1 = {
      id = 1
      name = "worker1"
      az = "eu-west-3b"
      ip_address = "10.100.11.10"
    },
    worker2 = {
      id = 2
      az = "eu-west-3c"
      name = "worker2"
      ip_address = "10.100.12.10"    
      },
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
