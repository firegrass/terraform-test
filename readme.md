# Store state in an s3 backend
Currently, this terraform file is simply storing state locally. Add a backend provider so that the state is stored in s3.
# Move variables out of the .tf file into a .tfvars file
The resources are currently using a few hard coded values directly in the .tf file itself. Move those variables into a tfvars file and use references instead.
# Create a security group for the ec2 instances
A security group was manually created in the AWS management console (called "sg-ipfs-arn"). Recreate this security group in terraform. In a comment, write down the process of reconciling the manually created sg with the new terraform resource. The security group has ingress of ports 4001, 8080, 22 open to all.
# Attach the ebs volumes to the aws instance
The terraform currently provisions ec2 instances and ebs volumes, but the ebs volumes are not attached to the instances. Attach the ebs volumes to the ec2 instances.
# Create a third ec2 instance in subnet "private-subnetid-3" in availability zone "eu-west-1c"
A third ec2 instance is needed, create it and attach an ebs volume.
# Convert current setup to a terraform module
The current setup does not allow for easy scalability, and the patterns seem more suited to the usage of a terraform module. 
