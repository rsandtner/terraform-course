variable "aws_profile" {
  type        = string
  description = "aws cli profile to use"
  default     = ""
}

variable "aws_region" {
    type = string
    description = "aws region to use"
    default = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
  default     = "learning-terraform"
}