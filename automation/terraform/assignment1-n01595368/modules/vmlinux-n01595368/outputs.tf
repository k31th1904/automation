output "VM_name" {
  value = values(azurerm_linux_virtual_machine.vm)[*].name
}
output "VM_fqdn" {
  value = values(azurerm_public_ip.pip)[*].fqdn
}
output "VM_PrivateIP" {
  value = values(azurerm_linux_virtual_machine.vm)[*].private_ip_address
}
output "VM_PublicIP" {
  value = values(azurerm_linux_virtual_machine.vm)[*].public_ip_address
}

