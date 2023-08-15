
output "linuxdisks_name" {
  value = azurerm_managed_disk.linuxdisk[*].name
}

