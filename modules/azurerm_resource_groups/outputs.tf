output "resource_group_ids" {
  description = "IDs of all created resource groups"
  value       = { for k, rg in azurerm_resource_group.rgs : k => rg.id }
}

output "resource_group_names" {
  description = "Names of all created resource groups"
  value       = { for k, rg in azurerm_resource_group.rgs : k => rg.name }
}

output "resource_group_locations" {
  description = "Locations of all created resource groups"
  value       = { for k, rg in azurerm_resource_group.rgs : k => rg.location }
}