variable "location" {
  description = "Location."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name."
  type        = string
}

variable "sql_server_name" {
  description = "SQL Server name."
  type        = string
}

variable "sql_db_name" {
  description = "SQL Database name."
  type        = string
}

variable "sql_sku" {
  description = "SQL SKU."
  type        = string
}

variable "sql_firewall_rule_name" {
  description = "SQL Server Firewall Rule name."
  type        = string
}

variable "allowed_ip_address" {
  description = "Verification agent IP address."
  type        = string
}

variable "kv_id" {
  description = "Azure Key Vault ID."
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

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
}