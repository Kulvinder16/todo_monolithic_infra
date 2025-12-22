data "azurerm_mssql_server" "sql_server_data" {
for_each = var.sql_database16
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
}