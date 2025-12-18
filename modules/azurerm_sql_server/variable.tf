variable "sql_server" {
    type = map(object({
kv_name = string
resource_group_name = string
location = string
db_username = string
db_password = string
server_name = string
}       
))  
}