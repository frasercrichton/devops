
# Virtual Private Cloud (VPC)

Creates a dedicated primary VPC with associated Internet Gateway, Subnet

The VPC specifies a default CIDR range of: "10.0.0.0/16"

cidr_block = var.VPC-CIDR-block

DNS support is enabled.

https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html

# Subnet

You are distributing your workload across multiple AZs to achieve fault-tolerance. Always, ALWAYS do this.

AWS provides geographic distribution out of the box in the form of Availability Zones (AZs). Every region has at least two.

Subnets cannot span multiple AZs. So to achieve fault tolerance, you need to divide your address space among the AZs evenly and create subnets in each. The more AZs, the better: if you have three AZs available, split your address space into four parts and keep the fourth segment as spare capacity.

VPC-CIDR-block = "10.0.0.0/24"

By default it's configured with the `us-east-1a` availability zone.


# Network Access Control List(NACL)


# Route Table

# Security Group





https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario1.html

https://nickcharlton.net/posts/terraform-aws-vpc.html
https://medium.com/@mitesh_shamra/manage-aws-vpc-with-terraform-d477d0b5c9c5
https://www.vic-l.com/how-to-setup-a-standard-aws-vpc-with-terraform/

