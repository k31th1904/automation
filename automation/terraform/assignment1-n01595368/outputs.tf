output "rg_name" {
  value = [
    module.resource_group.rg_name
  ]
}
output "vnet_name" {
  value = module.network.vnet1_name
}
output "vnet1_space" {
  value = module.network.vnet1_space[0]
}
output "subnet1_name" {
  value = module.network.subnet1_name
}
output "subnet1_space" {
  value = module.network.subnet1_space[0]
}
output "nsg1_name" {
  value = module.network.nsg1_name
}
output "storage_name" {
  value = module.common.storage_name
}
output "workspace_name" {
  value = module.common.workspace_name
}
output "vault_name" {
  value = module.common.vault_name
}