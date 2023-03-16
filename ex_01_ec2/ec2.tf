resource "aws_instance" "server_raquel_1" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_raquel.id]
  subnet_id = data.aws_subnets.def_vpc_subnets.ids[0]

  tags = {
    Name = "ec2-${local.name_suffix}-1"
  }
}

resource "aws_instance" "server_raquel_2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_raquel.id]
  subnet_id = data.aws_subnets.def_vpc_subnets.ids[1]

  tags = {
    Name = "ec2-${local.name_suffix}-2"
  }
}