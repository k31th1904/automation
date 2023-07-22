variable "rg_name" {}
variable "location" {}
variable "dbserver_name" {}
variable "dbserver_attributes" {
  type = map(any)
  default = {
    sku_name                     = "B_Gen5_1"
    storage_mb                   = 5120
    backup_retention_days        = 7
    geo_redundant_backup_enabled = false
    auto_grow_enabled            = false
    administrator_login          = "psqladmin"
    administrator_login_password = "n01595368!"
    version                      = "11"
    ssl_enforcement_enabled      = true
  }
}
variable "db_name" {}
variable "db_attributes" {
  type = map(any)
  default = {
    charset   = "UTF8"
    collation = "English_United States.1252"
  }
}

variable "common_tags" {
  default = {
    Assignment     = ""
    Name           = ""
    ExpirationDate = ""
    Environment    = ""
    Category       = ""
  }
}