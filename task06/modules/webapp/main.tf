resource "azurerm_service_plan" "asp" {
  name                = var.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.asp_sku
  tags                = var.tags
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      dotnet_version = var.app_dotnet_version
    }
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "0"
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }

  tags = var.tags
}