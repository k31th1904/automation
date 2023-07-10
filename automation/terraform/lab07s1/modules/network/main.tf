resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg
  address_space       = var.vnet_space
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_space1
}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_space2
}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    access                     = "Allow"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg2
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    access                     = "Allow"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    access                     = "Allow"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}


resource "azurerm_subnet_network_security_group_association" "association1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_subnet_network_security_group_association" "association2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}


