resource "aws_instance" "masters" {
  provider = aws
  ami           = var.ami_image
  instance_type = var.master_instance_type
  for_each = var.master_subnets
  root_block_device {
    volume_type = var.master_root_volume_type
    volume_size = var.master_root_volume_size
    delete_on_termination = "true"
  }
}

resource "aws_instance" "workers" {
  provider = aws
  ami           = var.ami_image
  instance_type = var.worker_instance_type
  for_each = var.worker_subnets
  root_block_device {
    volume_type = var.worker_root_volume_type
    volume_size = var.worker_root_volume_size
    delete_on_termination = "true"
  }
}
