output "dbserver_name" {
  value = azurerm_postgresql_server.dbserver
}
output "db_name" {
  value = azurerm_postgresql_database.db.name
}

