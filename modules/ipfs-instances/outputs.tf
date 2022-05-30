output "instance_ids" {
  description = "IDs of the ipfs instances"
  value = [aws_instance.ipfs1.id, aws_instance.ipfs2.id, aws_instance.ipfs3.id]
}
