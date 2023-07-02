variable "rg_name" {}
variable "location" {}
variable "subnet_id" {}
variable "storage_account_endpoint" {}
variable "vmsize" {
  default = "Standard_B1ms"
}
variable "adminusername" {
  default = "n01595368"
}
variable "publickey" {
  default = "~/.ssh/id_rsa.pub"
}
variable "privatekey" {
  default = "~/.ssh/id_rsa"
}
variable "disk_attributes" {
  type = map(any)
  default = {
    type    = "Standard_LRS"
    size    = 32
    caching = "ReadWrite"
  }
}
variable "OS_attribute" {
  type = map(any)
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
}

variable "linux_name" {
  type = map(any)
  default = {
    n01595368-w-vm1 = "1"
    n01595368-w-vm2 = "2"
    n01595368-w-vm3 = "3"
  }
}

variable "extension1" {
  type = map(any)
  default = {
    publisher                  = "NetworkWatcher"
    type                       = "NetworkWatcherAgentLinux"
    type_handler_version       = "1.0"
    auto_upgrade_minor_version = "true"
  }
}

variable "extension2" {
  type = map(any)
  default = {
    publisher                  = "AzureMonitor"
    type                       = "AzureMonitorLinuxAgent"
    type_handler_version       = "1.0"
    auto_upgrade_minor_version = "true"
  }
}

locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "hooyin.kwok"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
    Category       = "Linux VM"
  }
}