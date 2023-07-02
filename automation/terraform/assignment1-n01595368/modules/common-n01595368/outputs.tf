output "storage_account_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}
output "storage_name" {
  value = azurerm_storage_account.storage.name
}
output "workspace_name" {
  value = azurerm_log_analytics_workspace.workspace.name
}
output "vault_name" {
  value = azurerm_recovery_services_vault.vault.name
}
