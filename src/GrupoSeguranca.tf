resource "aws_security_group" "db" {
  name        = "db-security-group"
  description = "Security group for RDS"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "tcp_db" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.db.id
}

resource "aws_security_group_rule" "saida_db" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.db.id
}
