variable "region" {
  type        = string
  description = "Region name"
  default     = "ap-south-1"
}

variable "ami" {
  type        = string
  description = "AMI Namge"
  default     = "ami-007020fd9c84e18c7"
}

variable "mykey" {
  type        = string
  description = "Name of the private key"
  default     = "medium-role"
}

variable "tag" {
  type        = string
  description = "Name of the tag"
  default     = "jenkins-server-tag"
}

variable "instance_type" {
  type        = string
  description = "Name of the instance type"
  default     = "t3.medium"
}

variable "jenkins_server_secgr" {
  type        = string
  description = "Name of security group"
  default     = "medium-sg"
}

variable "role" {
  type        = string
  description = "Name of the role name"
  default     = "jenkins-role"
}

variable "jenkins-profile" {
  type        = string
  description = "Name of the Jenkins profile"
  default     = "petclinic-jenkins-server-profile"
}