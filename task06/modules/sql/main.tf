resource "random_password" "sql_password" {
  length  = 16
  special = true
}

locals {
  sql_admin_username = "sqladminuser"
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = local.sql_admin_username
  administrator_login_password = random_password.sql_password.result
  minimum_tls_version          = "1.2"
  tags                         = var.tags
}

resource "azurerm_mssql_database" "sql_db" {
  name       = var.sql_db_name
  server_id  = azurerm_mssql_server.sql_server.id
  sku_name   = var.sql_sku
  tags       = var.tags
  depends_on = [azurerm_mssql_server.sql_server]
}

resource "azurerm_mssql_firewall_rule" "allow_azure" {
  name             = "AllowAzure"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
  depends_on       = [azurerm_mssql_database.sql_db]
}

resource "azurerm_mssql_firewall_rule" "allow_ip" {
  name             = var.sql_firewall_rule_name
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
  depends_on       = [azurerm_mssql_database.sql_db]
}

resource "azurerm_key_vault_secret" "sql_admin_secret" {
  name         = var.sql_admin_secret_name
  value        = local.sql_admin_username
  key_vault_id = var.kv_id
  depends_on   = [azurerm_mssql_server.sql_server]
  tags         = var.tags
}

resource "azurerm_key_vault_secret" "sql_password_secret" {
  name         = var.sql_admin_secret_password
  value        = random_password.sql_password.result
  key_vault_id = var.kv_id
  depends_on   = [azurerm_mssql_server.sql_server]
  tags         = var.tags
}