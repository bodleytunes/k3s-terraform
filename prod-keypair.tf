resource "aws_key_pair" "k3s_laptop_key" {
  key_name   = "k3s_key"
  public_key = var.laptop_key
}

resource "aws_key_pair" "wizznet_aws_key" {
  key_name = "wizznet_aws_key"
  public_key = var.wizznet_aws_key
}