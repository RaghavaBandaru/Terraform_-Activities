variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "ports" {
  type    = list(number)
  default = [22, 80, 8080]
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

output "JenkinsMaster_Public_IP" {
  value = aws_instance.Jenkins_Master.public_ip
}

output "Jenkins_Slave_Public_IP" {
  value = aws_instance.Jenkins_Slave.public_ip
}

output "Jenkins_Slave_Private_IP" {
  value = aws_instance.Jenkins_Slave.private_ip
}
