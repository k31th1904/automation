variable "vmname" {
  default = "n01595368-u-vm1"
}

variable "vmsize" {
  default = "Standard_B1s"
}

variable "adminusername" {
  default = "n01595368"
}

variable "publickey" {
  default = "~/.ssh/id_rsa.pub"
}

variable "disk_attributes" {
  type = map(any)
  default = {
    type    = "Premium_LRS"
    size    = 32
    caching = "ReadWrite"
  }
}

variable "OS_attribute" {
  type = map(any)
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
