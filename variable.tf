variable "vpc" {
  description = "The Default VPC of EC2"
  type        = string
  default     = "vpc-0be40a17d234455e3"
}


variable "ami" {
  description = "The AMI ID of the instance"
  type        = string
  default     = "ami-0dfcb1ef8550277af"
}

variable "instance" {
  description = "The Instance type of EC2"
  type        = string
  default     = "t2.micro"
}

variable "ec2_user_data" {
  description = "User data shell script for Jenkins EC2"
  type        = string
  default     = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  sudo yum upgrade
  sudo amazon-linux-extras install java-openjdk11 -y
  sudo yum install -y jenkins
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
  EOF
}