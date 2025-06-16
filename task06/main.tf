resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = local.tags
}

data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

module "sql" {
  source                    = "./modules/sql"
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  sql_server_name           = local.sql_server_name
  sql_db_name               = local.sql_db_name
  sql_sku                   = var.sql_sku
  sql_firewall_rule_name    = var.sql_firewall_rule_name
  allowed_ip_address        = var.allowed_ip_address
  kv_id                     = data.azurerm_key_vault.kv.id
  sql_admin_secret_name     = var.sql_admin_secret_name
  sql_admin_secret_password = var.sql_admin_secret_password
  tags                      = local.tags
}

module "webapp" {
  source                = "./modules/webapp"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  asp_name              = local.asp_name
  asp_sku               = var.asp_sku
  app_name              = local.app_name
  sql_connection_string = module.sql.sql_connection_string
  app_dotnet_version    = var.app_dotnet_version
  tags                  = local.tags
}