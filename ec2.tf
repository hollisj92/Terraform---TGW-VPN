data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_launch_template" "ubuntu_template" {
  name_prefix = "ubuntu-launch-template"
  image_id = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8
      volume_type = "gp2"
    }
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
        Env: "${var.env_prefix}"
        Service: "${var.env_prefix}-${var.proj_prefix}"
        Name : "${var.env_prefix}-ubuntu_template"
        Role: "${var.env_prefix}-ubuntu_template"
        Team: "team-${var.team}"
    
    }
  }
}

resource "aws_autoscaling_group" "LAB_ASG" {
  name                 = "example-autoscaling-group"
  vpc_zone_identifier  = [aws_subnet.East_Subnet_1.id, aws_subnet.East_Subnet_2.id]
  launch_template {
    id      = aws_launch_template.ubuntu_template.id
    version = "$Latest"
  }
  min_size             = 1
  max_size             = 2
}

resource "aws_autoscaling_policy" "LAB_ASP" {
  name                   = "example-autoscaling-policy"
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.LAB_ASG.name

  scaling_adjustment     = 1
  cooldown               = 300
  adjustment_type        = "ChangeInCapacity"
}