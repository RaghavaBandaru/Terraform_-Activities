# Create an AWS EC2 Instance to host Ansible Controller (Control node)

resource "aws_security_group" "MyLab_Sec_Group" {
  name        = "Jenkins Security Group"
  description = "Allow inbound and outbound traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_trafic"
  }
}

data "aws_ami" "aws-linux-2-latest" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

resource "aws_instance" "Jenkins_Master" {
  ami                         = data.aws_ami.aws-linux-2-latest.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.MyLab_Sec_Group.id]
  associate_public_ip_address = true
  user_data                   = file("./scripts/JenkinsMaster.sh")

  tags = {
    Name = "Jenkins-Master"
  }
}

resource "aws_instance" "Jenkins_Slave" {
  ami                         = data.aws_ami.aws-linux-2-latest.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.MyLab_Sec_Group.id]
  associate_public_ip_address = true
  user_data                   = file("./scripts/JenkinsSlaveNode.sh")

  tags = {
    Name = "Jenkins-Slave"
  }
}
