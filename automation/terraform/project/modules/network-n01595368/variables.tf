variable "location" {}

variable "rg_name" {}

variable "vnet1_name" {
  default = ""
}

variable "vnet1_space" {}

variable "subnet1" {}

variable "subnet1_space" {}

variable "nsg1" {}


variable "common_tags" {
  default = {
    Assignment     = ""
    Name           = ""
    ExpirationDate = ""
    Environment    = ""
    Category       = ""
  }
}