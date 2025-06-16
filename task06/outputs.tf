output "sql_server_fqdn" {
  description = "FQDN of the SQL Server."
  value       = module.sql.sql_server_fqdn
}

output "app_hostname" {
  description = "Hostname of the Linux Web App."
  value       = module.webapp.app_hostname
}