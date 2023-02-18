resource "aws_vpn_gateway" "East_1_VPG" {
  vpc_id = aws_vpc.East_1_VPC.id

  tags = {
        Env: "${var.env_prefix}"
        Service: "${var.env_prefix}-${var.proj_prefix}"
        Name : "${var.env_prefix}-East_1_VPG"
        Role: "${var.env_prefix}-East_1_VPG"
        Team: "team-${var.team}"
    }
}

resource "aws_customer_gateway" "East_1_CG" {
  bgp_asn    = 65000
  ip_address = "${var.public_ip}"
  type       = "ipsec.1"

  tags = {
        Env: "${var.env_prefix}"
        Service: "${var.env_prefix}-${var.proj_prefix}"
        Name : "${var.env_prefix}-East_1_CG"
        Role: "${var.env_prefix}-East_1_CG"
        Team: "team-${var.team}"
    }
}