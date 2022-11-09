###
# Private Security Group
##
resource "aws_security_group" "Prod_SG" {
  name        = "${module.naming.aws_security_group}-Prod_SG_private"
  description = "Private internet access"
  vpc_id      = data.aws_vpc.vpc_id.id

  tags = {
    Name = "${module.naming.aws_security_group}-Prod_SG"
    Role = "private"
  }
}

resource "aws_security_group_rule" "Prod_SG_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.Prod_SG_private.id
}

resource "aws_security_group_rule" "Prod_SG_private_in_https_from_vpc" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [data.aws_vpc.vpc_id.cidr_block]

  security_group_id = aws_security_group.Prod_SG_private.id
}
