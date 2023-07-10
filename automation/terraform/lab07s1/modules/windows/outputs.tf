output "Windows_VM_name" {
  value = values(azurerm_windows_virtual_machine.winvm)[*].name
}
output "Windows_VM_fqdn" {
  value = values(azurerm_public_ip.winpip)[*].fqdn
}
output "Windows_VM_PrivateIP" {
  value = values(azurerm_windows_virtual_machine.winvm)[*].private_ip_address
}
output "Windows_VM_PublicIP" {
  value = values(azurerm_windows_virtual_machine.winvm)[*].public_ip_address
}
output "Windows_Avset" {
  value = azurerm_availability_set.winavset.name
}
