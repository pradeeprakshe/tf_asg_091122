# Creating 1st subnet 
resource "aws_subnet" "Prod_Subnet" {
  vpc_id                  = "${aws_vpc.Prod_VPC.id}"
  cidr_block             = "${var.subnet_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
tags = {
    Name = "Prod_Subnet"
  }
}
# Creating 2nd subnet 
resource "aws_subnet" "Prod_Subnet_1" {
  vpc_id                  = "${aws_vpc.Prod_VPC.id}"
  cidr_block             = "${var.subnet1_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
tags = {
    Name = "Prod_Subnet1"
  }
}