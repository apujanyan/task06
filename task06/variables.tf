variable "resources_name_prefix" {
  description = "Name prefix for resources."
  type        = string
}

variable "location" {
  description = "Location."
  type        = string
}

variable "kv_rg_name" {
  description = "Key Vault Resource group name."
  type        = string
}

variable "kv_name" {
  description = "Key Vault Name."
  type        = string
}

variable "sql_admin_secret_name" {
  description = "Key Vault Secret name for SQL admin name."
  type        = string
}

variable "sql_admin_secret_password" {
  description = "Key Vault Secret password for SQL admin password."
  type        = string
}

variable "sql_sku" {
  description = "SQL Database service model."
  type        = string
}

variable "sql_firewall_rule_name" {
  description = "SQL Server Firewall Rule name."
  type        = string
}

variable "asp_sku" {
  description = "App Service PLan SKU."
  type        = string
}

variable "app_dotnet_version" {
  description = "Web Application dotnet version."
  type        = string
}

variable "allowed_ip_address" {
  description = "Verification agent IP address."
  type        = string
}

variable "student_email" {
  description = "Student email address."
  type        = string
}