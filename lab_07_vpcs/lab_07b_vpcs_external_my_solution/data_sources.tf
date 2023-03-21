
data "aws_availability_zones" "available" {

  state = "available"
}

data "aws_ami" "amazon_linux2_kernel_5" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0*x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_vpc" "vpc_to_be_used" {
  filter {
    name   = "tag:Name"
    values = ["vpc-proj99-dev-07a"]
  }
  # este filtro es lo mismo que este :
  # tags = {
  #   Name = var.vpc_name
  # }
} 

data "aws_subnets" "my_public_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_to_be_used.id]
  }
  tags = {
    tier = "public"
  }

}
