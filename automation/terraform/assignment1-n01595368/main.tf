module "resource_group" {
  source   = "./modules/rgroup-n01595368"
  rg_name  = "n01595368-RG"
  location = "canadacentral"
}

module "network" {
  source        = "./modules/network-n01595368"
  location      = module.resource_group.rg_location
  rg_name       = module.resource_group.rg_name
  vnet1_name    = "n01595368-VNET"
  vnet1_space   = ["10.0.0.0/16"]
  subnet1       = "n01595368-SUBNET"
  subnet1_space = ["10.0.0.0/24"]
  nsg1          = "n01595368-NSG"
}

module "common" {
  source         = "./modules/common-n01595368"
  location       = module.resource_group.rg_location
  rg_name        = module.resource_group.rg_name
  storage_name   = "5368storage"
  workspace_name = "5368workspace"
  vault_name     = "recoveryvault5368"
}


module "vmlinux" {
  source                   = "./modules/vmlinux-n01595368"
  location                 = module.resource_group.rg_location
  rg_name                  = module.resource_group.rg_name
  subnet_id                = module.network.subnet1_ID
  storage_account_endpoint = module.common.storage_account_endpoint
}