resource "aws_vpc" "East_1_VPC" {
  cidr_block       = "172.0.0.0/16"
  instance_tenancy = "default"

  tags = {
        Env: "${var.env_prefix}"
        Service: "${var.env_prefix}-${var.proj_prefix}"
        Name : "${var.env_prefix}-East_1_VPC"
        Role: "${var.env_prefix}-East_1_VPC"
        Team: "team-${var.team}"
    }
}