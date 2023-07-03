output "windisks_name" {
  value = azurerm_managed_disk.windisk[*].name
}
output "linuxdisks_name" {
  value = azurerm_managed_disk.linuxdisk[*].name
}

