module "resource_group" {
  source     = "./modules/resource_group"
  network_rg = "Network-RG"
  linux_rg   = "Linux-RG"
  windows_rg = "Windows-RG"
  location   = "canadacentral"
}

module "network" {
  source        = "./modules/network"
  location      = module.resource_group.net_rg_location
  rg            = module.resource_group.network_rg_name
  vnet_name     = "network-vnet"
  vnet_space    = ["10.0.0.0/16"]
  subnet1       = "network-subnet1"
  subnet_space1 = ["10.0.0.0/24"]
  subnet2       = "network-subnet2"
  subnet_space2 = ["10.0.1.0/24"]
  nsg1          = "network-nsg1"
  nsg2          = "network-nsg2"
}

module "linux" {
  source         = "./modules/linux"
  location       = module.resource_group.linux_rg_location
  rg             = module.resource_group.linux_rg_name
  subnet_id      = module.network.Subnet1_ID
  vmname         = "n01595368-u-vm"
  vmsize         = "Standard_B1s"
  linux_avs_name = "linux_avset"
  nb_count       = 2
}

module "windows" {
  source    = "./modules/windows"
  location  = module.resource_group.windows_rg_location
  rg        = module.resource_group.windows_rg_name
  subnet_id = module.network.Subnet2_ID
  windows_name = {
    n01595368-w-vm1 = "Standard_B1s"
    n01595368-w-vm2 = "Standard_B1ms"
  }
  windows_avs_name = "windows_avset"
}