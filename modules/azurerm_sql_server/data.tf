data "azurerm_key_vault" "todo_infra_kv" {
  for_each = var.sql_server
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "kv_secret_db_username" {
  for_each = var.sql_server
  name         = each.value.db_username
  key_vault_id = data.azurerm_key_vault.todo_infra_kv[each.key].id
}

data "azurerm_key_vault_secret" "kv_secret_db_password" {
  for_each = var.sql_server
  name         = each.value.db_password
  key_vault_id = data.azurerm_key_vault.todo_infra_kv[each.key].id
}