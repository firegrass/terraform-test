# s3 backend

variable "aws_backend_s3_bucket" {
  type = string
}
variable "aws_backend_s3_key" {
  type = string
}
variable "aws_backend_s3_region" {
  type = string
}

# aws provider

variable "aws_profile" {
  type = string
}

variable "aws_assume_role_arn" {
  type    = string
  default = "arn:aws:iam::blabla:role/adminrole"
}

variable "aws_region" {
  type    = string
  default = "eu-west-1"
}
