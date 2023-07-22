module "rgroup-n01595368" {
  source   = "./modules/rgroup-n01595368"
  rg_name  = "n01595368-RG"
  location = "canadacentral"
  common_tags = {
    Assignment     = local.common_tags.Assignment
    Name           = local.common_tags.Name
    ExpirationDate = local.common_tags.ExpirationDate
    Environment    = local.common_tags.Environment
    Category       = "ResourceGroup"
  }
}

module "network-n01595368" {
  source        = "./modules/network-n01595368"
  location      = module.rgroup-n01595368.rg_location
  rg_name       = module.rgroup-n01595368.rg_name
  vnet1_name    = "n01595368-VNET"
  vnet1_space   = ["10.0.0.0/16"]
  subnet1       = "n01595368-SUBNET"
  subnet1_space = ["10.0.0.0/24"]
  nsg1          = "n01595368-NSG"
  common_tags = {
    Assignment     = local.common_tags.Assignment
    Name           = local.common_tags.Name
    ExpirationDate = local.common_tags.ExpirationDate
    Environment    = local.common_tags.Environment
    Category       = "NetworkResource"
  }
}

module "common-n01595368" {
  source         = "./modules/common-n01595368"
  location       = module.rgroup-n01595368.rg_location
  rg_name        = module.rgroup-n01595368.rg_name
  storage_name   = "5368storage"
  workspace_name = "5368workspace"
  vault_name     = "recoveryvault5368"
  common_tags = {
    Assignment     = local.common_tags.Assignment
    Name           = local.common_tags.Name
    ExpirationDate = local.common_tags.ExpirationDate
    Environment    = local.common_tags.Environment
    Category       = "CommonResources"
  }
}

module "vmlinux-n01595368" {
  source                   = "./modules/vmlinux-n01595368"
  location                 = module.rgroup-n01595368.rg_location
  rg_name                  = module.rgroup-n01595368.rg_name
  subnet_id                = module.network-n01595368.subnet1_ID
  storage_account_endpoint = module.common-n01595368.storage_account_endpoint
  OS_attribute = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
  # For_each list for linux instances where it is a map for AZ matching 
  linux_name = {
    n01595368-u-vm1 = "1"
    n01595368-u-vm2 = "2"
    n01595368-u-vm3 = "3"
  }
  common_tags = {
    Assignment     = local.common_tags.Assignment
    Name           = local.common_tags.Name
    ExpirationDate = local.common_tags.ExpirationDate
    Environment    = local.common_tags.Environment
    Category       = "vmlinux"
  }
}

module "vmwindows-n01595368" {
  source                   = "./modules/vmwindows-n01595368"
  location                 = module.rgroup-n01595368.rg_location
  rg_name                  = module.rgroup-n01595368.rg_name
  subnet_id                = module.network-n01595368.subnet1_ID
  storage_account_endpoint = module.common-n01595368.storage_account_endpoint
  nb_count                 = "1"
  windows_avs_name         = "windows_avset"
  vmname                   = "n01595368-w-vm"
  winOS_attribute = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  common_tags = {
    Assignment     = local.common_tags.Assignment
    Name           = local.common_tags.Name
    ExpirationDate = local.common_tags.ExpirationDate
    Environment    = local.common_tags.Environment
    Category       = "vmwindows"
  }
}

module "datadisk-n01595368" {
  source          = "./modules/datadisk-n01595368"
  location        = module.rgroup-n01595368.rg_location
  rg_name         = module.rgroup-n01595368.rg_name
  linux_vm_name   = module.vmlinux-n01595368.linux_vm_name
  linux_vm_id     = module.vmlinux-n01595368.linux_vm_id
  windows_vm_name = module.vmwindows-n01595368.windows_vm_name
  windows_vm_id   = module.vmwindows-n01595368.windows_vm_id
  linuxdisk_attributes = {
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 10
  }
  windisk_attributes = {
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 10
  }
  common_tags = {
    Assignment     = local.common_tags.Assignment
    Name           = local.common_tags.Name
    ExpirationDate = local.common_tags.ExpirationDate
    Environment    = local.common_tags.Environment
    Category       = "datadisk"
  }
}

module "loadbalancer-n01595368" {
  source          = "./modules/loadbalancer-n01595368"
  location        = module.rgroup-n01595368.rg_location
  rg_name         = module.rgroup-n01595368.rg_name
  pip_name        = "linuxlb-5368-pip"
  lb_name         = "LinuxLoadBalancer5368"
  pool_name       = "LinuxPool5368"
  nic_ids         = module.vmlinux-n01595368.linux_vm_nic_id
  ipconfigs       = module.vmlinux-n01595368.linux_vm_ipconfig_name
  diagnostic_name = "LoadBalancerLog5368"
  workspace_id    = module.common-n01595368.workspace_id
  common_tags = {
    Assignment     = local.common_tags.Assignment
    Name           = local.common_tags.Name
    ExpirationDate = local.common_tags.ExpirationDate
    Environment    = local.common_tags.Environment
    Category       = "LoadBalancer"
  }
}

module "database-n01595368" {
  source        = "./modules/database-n01595368"
  location      = module.rgroup-n01595368.rg_location
  rg_name       = module.rgroup-n01595368.rg_name
  dbserver_name = "psqlserver5368"
  db_name       = "psqldb5368"
  dbserver_attributes = {
    sku_name              = "B_Gen5_1"
    storage_mb            = 5120
    backup_retention_days = 7
    auto_grow_enabled     = false
    version               = "11"
  }
  common_tags = {
    Assignment     = local.common_tags.Assignment
    Name           = local.common_tags.Name
    ExpirationDate = local.common_tags.ExpirationDate
    Environment    = local.common_tags.Environment
    Category       = "Database"
  }
}
