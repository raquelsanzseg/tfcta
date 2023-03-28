# ==== resources
resource "aws_instance" "test_import" {
  ami           = data.aws_ami.ubuntu_22_04.id
  instance_type = var.instance_type
  # subnet_id = data.aws_subnets.def_vpc_subnets[0].id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sec_ssh_ping_import.id]
  tags = {
    Name = "vm-${local.name_suffix}-1"
  }
}



# Security group: allow ssh and ICMP ping from allowed external subnets
resource "aws_security_group" "sec_ssh_ping_import" {
  vpc_id = data.aws_vpc.def_vpc.id
  name   = "sg_${local.name_suffix}"
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
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "ec2_imported" {
  instance_type = "t3.micro"
  ami           = "ami-0779c326801d5a843"
  vpc_security_group_ids = [aws_security_group.sec_ssh_ping_import.id]

  lifecycle {
    ignore_changes = [
      tags
    ]
    # prevent_destroy = true
  }

  # security_groups = [
  #   "sg_proj99-dev-08a"
  # ]

}
# resource "aws_instance" "importada_rafa" {
#  tags = {
#   project = var.project
#  }


#  lifecycle {
#  ignore_changes = [
#    tags
#  ]
#   }
# }