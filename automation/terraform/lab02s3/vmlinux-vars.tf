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

variable "disk_acc_type" {
  default = "Premium_LRS"
}

variable "disk_size" {
  default = 32
}

variable "disk_caching" {
  default = "ReadWrite"
}

variable "OS_publisher" {
  default = "Canonical"
}

variable "OS_offer" {
  default = "UbuntuServer"
}

variable "OS_sku" {
  default = "18.04-LTS"
}

variable "OS_version" {
  default = "latest"
}
