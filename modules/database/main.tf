resource "random_password" "password" {
  length           = 16
  special          = true
}

resource "aws_db_instance" "database" {
  allocated_storage      = 5
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0.39"
  instance_class         = "db.t3.micro"
  identifier             = "${var.project}-db-instance"
  db_name                = "market"
  username               = "admin"
  password               = random_password.password.result
  db_subnet_group_name   = var.vpc.database_subnet_group
  vpc_security_group_ids = [var.sg.db]
  skip_final_snapshot    = true
  multi_az               = false
}
