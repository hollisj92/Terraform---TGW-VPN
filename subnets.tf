resource "aws_subnet" "East_Subnet_1" {
  vpc_id     = aws_vpc.East_1_VPC.id
  availability_zone = "us-east-1a"
  cidr_block = "172.0.1.0/28"

   tags = {
        Env: "${var.env_prefix}"
        Service: "${var.env_prefix}-${var.proj_prefix}"
        Name : "${var.env_prefix}-East_Subnet_1"
        Role: "${var.env_prefix}-East_Subnet_1"
        Team: "team-${var.team}"
    }
}

resource "aws_subnet" "East_Subnet_2" {
  vpc_id     = aws_vpc.East_1_VPC.id
  availability_zone = "us-east-1b"
  cidr_block = "172.0.2.0/28"

   tags = {
        Env: "${var.env_prefix}"
        Service: "${var.env_prefix}-${var.proj_prefix}"
        Name : "${var.env_prefix}-East_Subnet_2"
        Role: "${var.env_prefix}-East_Subnet_2"
        Team: "team-${var.team}"
    }
}