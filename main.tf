terraform {
  backend "s3" {
    bucket = var.aws_backend_s3_bucket
    key    = var.aws_backend_s3_key
    region = var.aws_backend_s3_region
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  assume_role {
    role_arn = var.aws_assume_role_arn
  }
}

resource "aws_instance" "ipfs1" {

  ami                         = var.ipfs_image_id
  associate_public_ip_address = false
  instance_type               = var.ipfs_instance_type
  key_name                    = var.ipfs_key_name
  availability_zone           = "${var.aws_region}a"
  vpc_security_group_ids      = var.ipfs_vpc_security_group_ids
  subnet_id                   = "private-subnetid-1"

}

resource "aws_instance" "ipfs2" {

  ami                         = var.ipfs_image_id
  associate_public_ip_address = false
  instance_type               = var.ipfs_instance_type
  key_name                    = var.ipfs_key_name
  availability_zone           = "${var.aws_region}b"
  vpc_security_group_ids      = var.ipfs_vpc_security_group_ids
  subnet_id                   = "private-subnetid-2"

}

resource "aws_ebs_volume" "ipfs1" {
  availability_zone = "${var.aws_region}a"
  size              = var.ipfs_ebs_size
}

resource "aws_ebs_volume" "ipfs2" {
  availability_zone = "${var.aws_region}b"
  size              = var.ipfs_ebs_size
}

