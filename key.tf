resource "tls_private_key" "rsa_key" {
  count     = var.exclude_ec2_instance ? 0 : 1
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  count      = var.exclude_ec2_instance ? 0 : 1
  key_name   = var.login_key
  public_key = tls_private_key.rsa_key[count.index].public_key_openssh
}
