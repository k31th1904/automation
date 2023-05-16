resource "azurerm_resource_group" "rg" {
	name = "network-rg"
	location = "canadacentral"
}

resource "azurerm_virtual_network" "vnet" {
	name = "network-vnet"
	location = azurerm_resource_group.rg.location
	resource_group_name = azurerm_resource_group.rg.name
	address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
	name = "network-subnet1"
	resource_group_name = azurerm_resource_group.rg.name
	virtual_network_name = azurerm_virtual_network.vnet.name
	address_prefixes = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
	name = "network-nsg1"
	location = azurerm_resource_group.rg.location
	resource_group_name = azurerm_resource_group.rg.name

	security_rule {
		name = "rule1"
		priority = 100
		access = "Allow"
		direction = "Inbound"
		protocol = "TCP"
		source_port_range = "*"
		destination_port_range = "22"
		source_address_prefix = "*"
		destination_address_prefix = "*"
	}

}

resource "azurerm_subnet_network_security_group_association" "association" {
	subnet_id = azurerm_subnet.subnet.id
	network_security_group_id = azurerm_network_security_group.nsg.id
}



