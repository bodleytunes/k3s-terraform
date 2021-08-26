variable infra_env {
  type = string
  description = "production environment"
}

variable infra_role {
  type = string
  description = "production role"
}

variable instance_size {
    type = string
    description = "instance size"
    default = "t2.nano"
}

variable instance_ami {
    type = string
    description = "Server image to use"
}

variable instance_root_device_size {
    type = number
    description = "Root volume size (in GB)"
    default = 8
}

variable instance_root_device_type {
    type = string
    description = "volume type"
    default = "gp2"
}

variable default_region {
  type = string
  default = "eu-west-3"
  description = "The default region"
}

