resource "aws_key_pair" "k3s_laptop_key" {
  key_name   = "k3s_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFFJnwBV704MYn2pgQKPbzIuW8PJmy3NZNX1TXfOnAqM super@DESKTOP-U8L96OL"
}

resource "aws_key_pair" "k3s_laptop_key2" {
  key_name   = "k3s_key2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2bp4Xb/acHwNAMwGyTjN8aGdWRQx4mJ8IXKPnZiOVapAdlXVx8fjRui/UkwfGOGq7dskL4StH1x75seb6TB4k3d5kQcSQseMiCitht+CPMDW/pYVPhFekQarDX0LILEFX+5vuXHlZwRtKFE21zqWoFdmdwaVlQN6g3/taspGmkM/pjvQpwBTLWcrbX48lS4Hg99hwrewuRPkz7D5PW7KPYU4MxrZxt+woSQ4L/JyhSzMJTQoJodZc+pWDADXsEIkCidl3+TBarF5/SUMdboGsjl8XEbmK6p2nBolE45hiWbXk07JrCcCOZ4YNVGOsVmesbeNbj4c2sNtS7e9cFYSIICyQ6oPb/usTI01Plztrlr+VFBoGzoXQbYqz6eNPqgNkwhY1Deig2OzyxgPWKae+vOYxRE8p9NE1ZMdmHHppPVfT30ENITBA5f+T3yvXjJ42d4dO3fcYtA9rzu1MJrOdmNdw3/iJqhOQ38Xz5oqYzZogFroGUKus6ILun0O85NM= super@DESKTOP-U8L96OL"
}