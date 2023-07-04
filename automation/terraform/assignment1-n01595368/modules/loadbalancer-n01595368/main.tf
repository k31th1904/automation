resource "azurerm_public_ip" "lbpip" {
  name                = var.pip_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.lbpip_sku
  allocation_method   = "Static"
  tags                = local.common_tags
}

resource "azurerm_lb" "linuxlb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.lb_sku
  frontend_ip_configuration {
    name                 = "PublicIP"
    public_ip_address_id = azurerm_public_ip.lbpip.id
  }
  tags = local.common_tags
}

resource "azurerm_lb_backend_address_pool" "lbpool" {
  loadbalancer_id = azurerm_lb.linuxlb.id
  name            = var.pool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "linuxasso" {
  count                   = length(var.nic_ids)
  network_interface_id    = var.nic_ids[count.index]
  ip_configuration_name   = var.ipconfigs[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.lbpool.id
}

resource "azurerm_lb_rule" "lbrule" {
  for_each                       = local.lbrules
  loadbalancer_id                = azurerm_lb.linuxlb.id
  name                           = each.key
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = azurerm_lb.linuxlb.frontend_ip_configuration[0].name
}

resource "azurerm_lb_probe" "lbproble" {
  for_each        = local.lbprobes
  loadbalancer_id = azurerm_lb.linuxlb.id
  name            = each.value.name
  port            = each.value.port
}