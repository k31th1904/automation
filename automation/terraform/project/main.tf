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
    n01595368-c-vm1 = "1"
    n01595368-c-vm2 = "2"
    n01595368-c-vm3 = "3"
  }
  common_tags = {
    Assignment     = local.common_tags.Assignment
    Name           = local.common_tags.Name
    ExpirationDate = local.common_tags.ExpirationDate
    Environment    = local.common_tags.Environment
    Category       = "vmlinux"
  }
}

module "datadisk-n01595368" {
  source        = "./modules/datadisk-n01595368"
  location      = module.rgroup-n01595368.rg_location
  rg_name       = module.rgroup-n01595368.rg_name
  linux_vm_name = module.vmlinux-n01595368.linux_vm_name
  linux_vm_id   = module.vmlinux-n01595368.linux_vm_id
  linuxdisk_attributes = {
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 10
    create_option        = "Empty"
    caching              = "ReadWrite"
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
    sku_name                     = "B_Gen5_1"
    storage_mb                   = 5120
    backup_retention_days        = 7
    auto_grow_enabled            = false
    version                      = "11"
    geo_redundant_backup_enabled = false
    administrator_login          = "psqladmin"
    administrator_login_password = var.dbsecret
    ssl_enforcement_enabled      = true
  }
  common_tags = {
    Assignment     = local.common_tags.Assignment
    Name           = local.common_tags.Name
    ExpirationDate = local.common_tags.ExpirationDate
    Environment    = local.common_tags.Environment
    Category       = "database"
  }
}

module "ansible-n01595368" {
  source        = "./modules/ansible-n01595368"
  linux_vm_fqdn = module.vmlinux-n01595368.linux_vm_fqdn
  linux_var = {
    ssh_user       = "n01595368"
    ssh_privatekey = "~/.ssh/id_rsa"
  }
  depends_on = [module.datadisk-n01595368, module.vmlinux-n01595368]
}

variable "dbsecret" {}
# Secret is not supposed to be hardcode and can be loaded from environment variable
# If environment variable is not defined, terraform prompt for a value