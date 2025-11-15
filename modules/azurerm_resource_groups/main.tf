resource "azurerm_resource_group" "rgs" {
  for_each = var.resource_groups

  name       = each.value.name
  location   = each.value.location
  managed_by = try(each.value.managed_by, null)
  tags       = try(each.value.tags, {})
}
