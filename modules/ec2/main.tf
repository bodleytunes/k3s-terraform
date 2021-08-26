
data "aws_ami" "app" {
    most_recent = true
    owners = ["canonical"]


    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20*"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name = "architecture"
        values = ["x86_64"]
    }
}

resource "aws_instance" "master_server" {
    ami = var.instance_ami

    instance_type = "t2.medium"

    root_block_device {
        volume_size = var.instance_root_device_size
        volume_type = var.instance_root_device_type
    }

    tags = {
        Name = "wizznet-${var.infra_env}-master"
        Role = "master"
        Project = "k3s"
        Environment = var.infra_env
        ManagedBy = "terraform"
    }