resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key" {
  filename        = "${path.module}/vm-linux-01.pem"
  content         = tls_private_key.ssh_key.private_key_pem
  file_permission = "0600"
}