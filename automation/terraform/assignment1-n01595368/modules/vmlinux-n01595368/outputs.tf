output "vm_name" {
  value = values(azurerm_linux_virtual_machine.vm)[*].name
}
output "vm_fqdn" {
  value = values(azurerm_public_ip.pip)[*].fqdn
}
output "vm_privateIP" {
  value = values(azurerm_linux_virtual_machine.vm)[*].private_ip_address
}
output "vm_publicIP" {
  value = values(azurerm_linux_virtual_machine.vm)[*].public_ip_address
}

