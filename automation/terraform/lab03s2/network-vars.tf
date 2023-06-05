variable "rg" {
  default = "network-rg"
}

variable "location" {
  default = "canadacentral"
}

variable "vnet" {
  default = "network-vnet"
}

variable "vnet_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet" {
  type    = list(any)
  default = ["network-subnet1", "network-subnet2"]
}

variable "subnet_space" {
  type = map(any)
  default = {
    subnet_space1 = ["10.0.0.0/24"]
    subnet_space2 = ["10.0.1.0/24"]
  }
}

variable "nsg" {
  type    = list(any)
  default = ["network-nsg1", "network-nsg2"]
}
