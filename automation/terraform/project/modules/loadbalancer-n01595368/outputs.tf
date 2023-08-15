output "lb_name" {
  value = azurerm_lb.linuxlb.name
}

output "lbpip_fqdn" {
  value = azurerm_public_ip.lbpip.fqdn
}

output "lbpip_public_ip" {
  value = azurerm_public_ip.lbpip.ip_address
}
