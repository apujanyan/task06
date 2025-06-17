variable "location" {
  description = "Location."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name."
  type        = string
}

variable "asp_name" {
  description = "App Service PLan name."
  type        = string
}

variable "asp_sku" {
  description = "App Service PLan SKU."
  type        = string
}

variable "app_name" {
  description = "Web App name."
  type        = string
}

variable "sql_connection_string" {
  description = "SQL connection string."
  sensitive   = true
  type        = string
}

variable "app_dotnet_version" {
  description = "Web Application dotnet version."
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
}