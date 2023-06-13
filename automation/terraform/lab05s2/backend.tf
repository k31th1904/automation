terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-n01595368-RG"
    storage_account_name = "tfstaten01595368sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}