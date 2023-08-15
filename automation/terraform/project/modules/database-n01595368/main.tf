resource "azurerm_postgresql_server" "dbserver" {
  name                         = var.dbserver_name
  location                     = var.location
  resource_group_name          = var.rg_name
  sku_name                     = var.dbserver_attributes.sku_name
  storage_mb                   = var.dbserver_attributes.storage_mb
  backup_retention_days        = var.dbserver_attributes.backup_retention_days
  geo_redundant_backup_enabled = var.dbserver_attributes.geo_redundant_backup_enabled
  auto_grow_enabled            = var.dbserver_attributes.auto_grow_enabled
  administrator_login          = var.dbserver_attributes.administrator_login
  administrator_login_password = var.dbserver_attributes.administrator_login_password
  version                      = var.dbserver_attributes.version
  ssl_enforcement_enabled      = var.dbserver_attributes.ssl_enforcement_enabled
  tags                         = var.common_tags

}

resource "azurerm_postgresql_database" "db" {
  name                = var.db_name
  resource_group_name = azurerm_postgresql_server.dbserver.resource_group_name
  server_name         = azurerm_postgresql_server.dbserver.name
  charset             = var.db_attributes.charset
  collation           = var.db_attributes.collation
}