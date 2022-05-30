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

# resources

variable "ipfs_image_id" {
  type    = string
  default = "ami-abcd1234"
}

variable "ipfs_instance_type" {
  type    = string
  default = "t2.medium"
}

variable "ipfs_key_name" {
  type    = string
  default = "ipfs-keypair-name"
}

variable "ipfs_vpc_security_group_ids" {
  type    = list(string)
  default = ["sg-ipfs-arn"]
}

variable "ipfs_ebs_size" {
  type    = number
  default = 100
}
