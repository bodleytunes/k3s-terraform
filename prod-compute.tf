
#resource "random_shuffle" "master_subnet_shuffle" {
#  input        = tolist(data.aws_subnet_ids.master_subnet_ids.ids)
#  result_count = 1
#  depends_on = [data.aws_subnet_ids.master_subnet_ids]
#}
#
#resource "random_shuffle" "worker_subnet_shuffle" {
#  input        = tolist(data.aws_subnet_ids.worker_subnet_ids.ids)
#  result_count = 1
#  depends_on = [data.aws_subnet_ids.worker_subnet_ids]
#}

resource "aws_instance" "masters" {
  provider = aws
  ami      = var.ami_image
  key_name = aws_key_pair.k3s_laptop_key.key_name
  instance_type = var.master_instance_type
  for_each = var.master_instances
  #subnet_id = tolist(data.aws_subnet_ids.master_subnet_ids.ids)[0]
  #subnet_id = random_shuffle.master_subnet_shuffle.result[0]
  #subnet_id = [for az, subnet in aws_subnet.master_subnets: subnet.id][each.value.subnet]
  subnet_id = [for subnet in aws_subnet.master_subnets: subnet.id if subnet.availability_zone == each.value.az][0]
  vpc_security_group_ids = [aws_security_group.main.id]
  private_ip = each.value.ip_address


  root_block_device {
    volume_type = var.master_root_volume_type
    volume_size = var.master_root_volume_size
    delete_on_termination = "true"
  }

  tags = merge(
    {
      Name        = "master${each.value.id}"
      Project     = var.project
      Environment = var.prod_env
      ManagedBy   = "terraform"
    }
  )
}

resource "aws_instance" "workers" {
  provider = aws
  ami           = var.ami_image
  key_name = aws_key_pair.k3s_laptop_key.key_name
  instance_type = var.worker_instance_type
  for_each = var.worker_instances
  #subnet_id = [for az, subnet in aws_subnet.worker_subnets: subnet.id][each.value.subnet]
  subnet_id = [for subnet in aws_subnet.worker_subnets: subnet.id if subnet.availability_zone == each.value.az][0]
  vpc_security_group_ids = [aws_security_group.main.id]
  private_ip = each.value.ip_address



  root_block_device {
    volume_type = var.worker_root_volume_type
    volume_size = var.worker_root_volume_size
    delete_on_termination = "true"
  }

  tags = merge(
    {
      Name        = "worker${each.value.id}"
      Project     = var.project
      Environment = var.prod_env
      ManagedBy   = "terraform"
    }
  )
}

