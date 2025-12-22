



resource "azurerm_mssql_database" "sql_db" {
for_each = var.sql_database16
  name         = each.value.db_name
  server_id    = data.azurerm_mssql_server.sql_server_data[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS"

}