resource "aws_instance" "my-first-server" {
  ami             = "ami-080e1f13689e07408"
  instance_type   = "t2.micro"
  key_name        = "aru@micr"
  subnet_id       = "subnet-0e2f266f9b67ec029"
  security_groups = [aws_security_group.allow-ssh.id]

}

resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "Allow SSH from your network"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.245.194.245/32"]

  }
}