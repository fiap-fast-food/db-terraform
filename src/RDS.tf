resource "aws_security_group_rule" "allow_all_ingress" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]  
  security_group_id = aws_security_group.db.id 
}
resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_name                = "fiapfastfood"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  username               = "postgres"
  password               = "rootroot"
  skip_final_snapshot    = true
  publicly_accessible    = true
  db_subnet_group_name   = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [aws_security_group.db.id]
}

output "IP" {
  value = aws_db_instance.default.address
}
