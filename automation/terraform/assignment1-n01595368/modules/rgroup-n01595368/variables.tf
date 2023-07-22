variable "rg_name" {}

variable "location" {}


variable "common_tags" {
  default = {
    Assignment     = ""
    Name           = ""
    ExpirationDate = ""
    Environment    = ""
    Category       = ""
  }
}