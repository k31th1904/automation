output "windows_vm_name" {
  value = [azurerm_windows_virtual_machine.winvm[*].name]
}
output "windows_vm_fqdn" {
  value = [azurerm_public_ip.winpip[*].fqdn]
}
output "windows_vm_privateIP" {
  value = [azurerm_windows_virtual_machine.winvm[*].private_ip_address]
}
output "windows_vm_publicIP" {
  value = [azurerm_windows_virtual_machine.winvm[*].public_ip_address]
}
output "windows_avset" {
  value = azurerm_availability_set.winavset.name
}
