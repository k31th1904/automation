resource "azurerm_storage_account" "storage" {
  name                     = var.storage_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.storage_att.tier
  account_replication_type = var.storage_att.replication
  tags                     = local.common_tags
}

resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.workspace_att.sku
  retention_in_days   = var.workspace_att.retention
  tags                = local.common_tags
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = var.vault_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.vault_att.sku
  tags                = local.common_tags
}
