resource "azurerm_resource_group" "network_rg" {
  name     = var.network_rg
  location = var.location
}

resource "azurerm_resource_group" "linux_rg" {
  name     = var.linux_rg
  location = var.location
}

resource "azurerm_resource_group" "windows_rg" {
  name     = var.windows_rg
  location = var.location
}
