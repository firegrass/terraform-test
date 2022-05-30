variable "ipfs1_subnet_id" {
  type    = string
}

variable "ipfs2_subnet_id" {
  type    = string
}

variable "ipfs3_subnet_id" {
  type    = string
}

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

variable "ipfs_ebs_size" {
  type    = number
  default = 100
}

