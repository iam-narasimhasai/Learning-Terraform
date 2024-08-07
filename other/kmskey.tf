resource "aws_kms_key" "default" {
  description             = "kms key for RDS"
  deletion_window_in_days = 7
  is_enabled              = true
  enable_key_rotation     = true

  tags = {
    Name = "terraform_keyforrds_secrets_manager"
  }
}

resource "random_password" "random_password" {
  length           = 16
  special          = true
  override_special = "$!&%~`"

}
resource "aws_secretsmanager_secret" "name" {
  name        = "rds_Admin"
  kms_key_id  = aws_kms_key.default.key_id
  description = "rds admin password"

  recovery_window_in_days = 14
  tags = {
    Name = "terraform rds"
  }
}

resource "aws_secretsmanager_secret_version" "aws_secretsmanager_secret_version" {
  secret_id     = aws_secretsmanager_secret.name.id
  secret_string = random_password.random_password.result
}