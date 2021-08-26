
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

resource "aws_instance" "master" {
    ami = data.aws_ami.app.id
    instance_type = "t2.medium"

    root_block_device {
        volume_size = 8 # GiB
        volume_type = "gp2"
    }