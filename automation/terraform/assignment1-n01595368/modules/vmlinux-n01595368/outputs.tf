output "linux_vm_name" {
  # foreach & object map based
  value = values(azurerm_linux_virtual_machine.vm)[*].name
}
output "linux_vm_fqdn" {
  value = values(azurerm_public_ip.pip)[*].fqdn
}
output "linux_vm_privateIP" {
  value = values(azurerm_linux_virtual_machine.vm)[*].private_ip_address
}
output "linux_vm_publicIP" {
  value = values(azurerm_linux_virtual_machine.vm)[*].public_ip_address
}
output "linux_vm_id" {
  # foreach & object map based
  value = values(azurerm_linux_virtual_machine.vm)[*].id
}

