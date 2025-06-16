locals {
  rg_name         = "${var.resources_name_prefix}-rg"
  sql_server_name = "${var.resources_name_prefix}-sqlsrv"
  sql_db_name     = "${var.resources_name_prefix}-sqldb"
  asp_name        = "${var.resources_name_prefix}-asp"
  app_name        = "${var.resources_name_prefix}-app"
  tags = {
    Creator = var.student_email
  }
}