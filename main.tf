terraform {
  backend "s3" {
    bucket = "jlmuahezbm795rdy7od5"
    key    = "tf-test-key"
    region = "eu-west-1"
  }
}

provider "aws" {
  region  = "eu-west-1"
  profile = var.aws_profile
  assume_role {
    role_arn = "arn:aws:iam::blabla:role/adminrole"
  }
}

resource "aws_instance" "ipfs1" {

  ami                         = "ami-abcd1234"
  associate_public_ip_address = false
  instance_type               = "t2.medium"
  key_name                    = "ipfs-keypair-name"
  availability_zone           = "eu-west-1a"
  vpc_security_group_ids      = ["sg-ipfs-arn"]
  subnet_id                   = "private-subnetid-1"

}

resource "aws_instance" "ipfs2" {

  ami                         = "ami-abcd1234"
  associate_public_ip_address = false
  instance_type               = "t2.medium"
  key_name                    = "ipfs-keypair-name"
  availability_zone           = "eu-west-1b"
  vpc_security_group_ids      = ["sg-ipfs-arn"]
  subnet_id                   = "private-subnetid-2"

}

resource "aws_ebs_volume" "ipfs1" {
  availability_zone = "eu-west-1a"
  size              = 100
}

resource "aws_ebs_volume" "ipfs2" {
  availability_zone = "eu-west-1a"
  size              = 100
}

