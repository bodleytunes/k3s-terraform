variable "aws_region" {
  type    = string
  default = "eu-west-3"
}

variable "subnets" {
    default = [
        {
            name = "master-prod1"
            az = "eu-west-3a"
            cidr = "10.100.0.0/24"
        },
        {
            name = "master-prod2"
            az = "eu-west-3b"
            cidr = "10.100.1.0/24"
        },
        {   
            name = "master-prod3"
            az = "eu-west-3c"
            cidr = "10.100.2.0/24"
        },            

    ]
}