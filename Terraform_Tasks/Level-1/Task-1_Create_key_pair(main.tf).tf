resource "tls_private_key" "datacenter-kp" {
  algorithm = "RSA"
}

resource "local_file" "datacenter-kp" {
  content         = tls_private_key.datacenter-kp.private_key_pem
  filename       = "/home/bob/datacenter-kp.pem"
  file_permission = "0600"
}

resource "aws_key_pair" "datacenter-kp" {
  key_name   = "datacenter-kp"
  public_key = tls_private_key.datacenter-kp.public_key_openssh
}
