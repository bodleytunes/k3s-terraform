resource "aws_instance" "masters" {
  provider = aws
  ami           = var.ami_image
  key_name = aws_key_pair.k3s_laptop_key.key_name
  instance_type = var.master_instance_type
  for_each = aws_subnet.master_subnets
  subnet_id = each.value.id
  root_block_device {
    volume_type = var.master_root_volume_type
    volume_size = var.master_root_volume_size
    delete_on_termination = "true"
  }

  tags = merge(
    {
      Name        = "master${each.key}"
      Project     = var.project
      Environment = var.prod_env
      ManagedBy   = "terraform"
    }
  )
}

resource "aws_instance" "workers" {
  provider = aws
  ami           = var.ami_image
  instance_type = var.worker_instance_type
  for_each = aws_subnet.worker_subnets
  subnet_id = each.value.id
  root_block_device {
    volume_type = var.worker_root_volume_type
    volume_size = var.worker_root_volume_size
    delete_on_termination = "true"
  }

  tags = merge(
    {
      Name        = "worker${each.key}"
      Project     = var.project
      Environment = var.prod_env
      ManagedBy   = "terraform"
    }
  )
}

