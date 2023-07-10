output "VM_name" {
  value = azurerm_linux_virtual_machine.vm[*].name
}
output "VM_fqdn" {
  value = azurerm_public_ip.pip[*].fqdn
}
output "VM_PrivateIP" {
  value = azurerm_linux_virtual_machine.vm[*].private_ip_address
}
output "VM_PublicIP" {
  value = azurerm_linux_virtual_machine.vm[*].public_ip_address
}
output "Linux_avs_set" {
  value = azurerm_availability_set.avset.name
}
