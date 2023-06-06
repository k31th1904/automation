output "Linux_VM_name" {
  value = [azurerm_linux_virtual_machine.vm[*].name]
}
output "Linux_VM_fqdn" {
  value = [azurerm_public_ip.pip[*].fqdn]
}
output "Linux_VM_PrivateIP" {
  value = [azurerm_linux_virtual_machine.vm[*].private_ip_address]
}
output "Linux_VM_PublicIP" {
  value = [azurerm_linux_virtual_machine.vm[*].public_ip_address]
}

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

output "VNET_Name" {
  value = azurerm_virtual_network.vnet.name
}
output "VNET_Space" {
  value = azurerm_virtual_network.vnet.address_space[0]
}
output "Subnet1_Name" {
  value = azurerm_subnet.subnet.name
}
output "Subnet1_Space" {
  value = azurerm_subnet.subnet.address_prefixes[0]
}
output "Subnet2_Name" {
  value = azurerm_subnet.subnet2.name
}
output "Subnet2_Space" {
  value = azurerm_subnet.subnet2.address_prefixes[0]
}
output "Linux_Avset" {
  value = azurerm_availability_set.avset.name
}

output "Windows_Avset" {
  value = azurerm_availability_set.winavset.name
}

