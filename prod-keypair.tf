resource "aws_key_pair" "k3s_laptop_key" {
  key_name   = "k3s_key"
  public_key = var.laptop_key
}

#resource "aws_key_pair" "k3s_laptop_key2" {
#  key_name   = "k3s_key2"
#  public_key = var.laptop_key
#}