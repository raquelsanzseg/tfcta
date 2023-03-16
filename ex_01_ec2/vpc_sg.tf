resource "aws_security_group" "sg_raquel" {
  name   = "sec-web-${local.name_suffix}"
  vpc_id      = data.aws_vpc.def_vpc.id

  ingress {
    description = "SSH from specific addresses"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.sec_allowed_external
  }
  ingress {
    description = "Ping from specific addresses"
    from_port   = 8 # ICMP Code 8 - echo  (0 is echo reply)
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = var.sec_allowed_external
    # security_groups = [aws_security_group.sec_alb.id]
  }

  ingress {
    description = "TCP Port 80 from specific addresses"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.sec_allowed_external
  }

  ingress {
    description = "Allow TCP for special portfrom specific addresses"
    from_port   = var.special_port
    to_port     = var.special_port
    protocol    = "tcp"
    cidr_blocks = var.sec_allowed_external
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sg-${local.name_suffix}"
  }
  lifecycle {
    create_before_destroy = true
  }
}