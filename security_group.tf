resource "aws_security_group" "public_sg" {
  name        = "${var.aws_environment}-public-sg"
  description = "Remote desktop access"
  vpc_id      = "${aws_vpc.bamboovpc.id}"

  tags = {
    "Name" = "${var.aws_environment}-public-sg"
  }
}

resource "aws_security_group_rule" "public_rdp_access" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.public_sg.id}"
}

resource "aws_security_group_rule" "public_bamboo" {
  type              = "ingress"
  from_port         = 54663
  to_port           = 54663
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.public_sg.id}"
}

resource "aws_security_group_rule" "public_bamboo_secure" {
  type              = "ingress"
  from_port         = 54667
  to_port           = 54667
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.public_sg.id}"
}

resource "aws_security_group_rule" "internet_access" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.public_sg.id}"
}

resource "aws_security_group_rule" "internet_access_secure" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.public_sg.id}"
}
