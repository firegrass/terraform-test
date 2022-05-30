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

module "ipfs_instances" {
  source = "./modules/ipfs-instances"

  ipfs1_subnet_id = "private-subnetid-1"
  ipfs2_subnet_id = "private-subnetid-2"
  ipfs3_subnet_id = "private-subnetid-3"
  # ipfs_image_id = "..."
  # ipfs_instance_type = "..."
  # ipfs_key_name = "..."
  # ipfs_ebs_size = "..."
}
