variable "sql_database16" {
type = map(object(
    {
server_name = string
resource_group_name = string
db_name = string
max_size_gb = number
    }
))
  
}