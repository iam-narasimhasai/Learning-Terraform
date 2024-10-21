resource "aws_db_subnet_group" "prod_subnet_grp" {
  name = "prod-db-subnetgroup"
  subnet_ids = [
    aws_subnet.subnet1-public.id,
    aws_subnet.subnet2-public.id,
    aws_subnet.subnet3-public.id
  ]
}
data "aws_secretsmanager_secret" "data_secret" {
  name = "prod-db-password"
}
data "aws_secretsmanager_secret_version" "dbsecret_version" {
  secret_id = data.aws_secretsmanager_secret.data_secret.id
}
resource "aws_db_instance" "prod_db_instance" {
  identifier        = "proddb"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0.39"
  instance_class    = "db.t2.medium"
  db_name           = "prod_db"
  username          = "adminuser"
  password          = data.aws_secretsmanager_secret_version.dbsecret_version.secret_string
  publicly_accessible = true
  db_subnet_group_name = aws_db_subnet_group.prod_subnet_grp.id


}