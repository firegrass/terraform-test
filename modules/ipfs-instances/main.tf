resource "aws_security_group" "ipfs-sg" {
  name = "ipfs-sg"
}

resource "aws_security_group_rule" "ipfs-ingress-4001" {
  type              = "ingress"
  from_port         = 4001
  to_port           = 4001
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ipfs-sg
}

resource "aws_security_group_rule" "ipfs-ingress-8080" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ipfs-sg
}

resource "aws_security_group_rule" "ipfs-ingress-22" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ipfs-sg
}

resource "aws_security_group_rule" "ipfs-egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.ipfs-sg
}

resource "aws_instance" "ipfs1" {
  ami                         = var.ipfs_image_id
  associate_public_ip_address = false
  instance_type               = var.ipfs_instance_type
  key_name                    = var.ipfs_key_name
  vpc_security_group_ids      = [aws_security_group.ipfs-sg.id]
  subnet_id                   = var.ipfs1_subnet_id
}

resource "aws_instance" "ipfs2" {
  ami                         = var.ipfs_image_id
  associate_public_ip_address = false
  instance_type               = var.ipfs_instance_type
  key_name                    = var.ipfs_key_name
  vpc_security_group_ids      = [aws_security_group.ipfs-sg.id]
  subnet_id                   = var.ipfs2_subnet_id
}

resource "aws_instance" "ipfs3" {
  ami                         = var.ipfs_image_id
  associate_public_ip_address = false
  instance_type               = var.ipfs_instance_type
  key_name                    = var.ipfs_key_name
  vpc_security_group_ids      = [aws_security_group.ipfs-sg.id]
  subnet_id                   = var.ipfs3_subnet_id
}

resource "aws_ebs_volume" "ipfs1" {
  availability_zone = "${var.aws_region}a"
  size              = var.ipfs_ebs_size
}

resource "aws_ebs_volume" "ipfs2" {
  availability_zone = "${var.aws_region}b"
  size              = var.ipfs_ebs_size
}

resource "aws_ebs_volume" "ipfs3" {
  availability_zone = "${var.aws_region}c"
  size              = var.ipfs_ebs_size
}

resource "aws_volume_attachment" "ipfs1" {
  device_name = "/dev/sda"
  volume_id   = aws_ebs_volume.ipfs1.id
  instance_id = aws_instance.ipfs1.id
}

resource "aws_volume_attachment" "ipfs2" {
  device_name = "/dev/sda"
  volume_id   = aws_ebs_volume.ipfs2.id
  instance_id = aws_instance.ipfs2.id
}

resource "aws_volume_attachment" "ipfs3" {
  device_name = "/dev/sda"
  volume_id   = aws_ebs_volume.ipfs3.id
  instance_id = aws_instance.ipfs3.id
}
