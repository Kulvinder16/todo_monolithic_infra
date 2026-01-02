variable "resource_groups" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}


# variable "storage_accounts" {
#   type = map(object({
#     name                     = string
#     resource_group_name      = string
#     location                 = string
#     account_tier             = string
#     account_replication_type = string
#     tags                     = map(string)
#   }))
# }

variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = list(object(
      {
        name = string
      address_prefixes = list(string) }
    ))
    }
  ))
}

variable "pip" {
  type = map(object(
    { name                = string
      resource_group_name = string
      location            = string
      allocation_method   = string
      tags                = optional(map(string))
  }))

}

variable "kv" {
  type = map(object(
    {
      kv_name             = string
      location            = string
      resource_group_name = string
    }
  ))
}

variable "vms" {
  type = map(object({
    pip_name            = string
    subnet_name         = string
    v_net_name          = string
    kv_name             = string
    vm_size             = string
    nic_name            = string
    location            = string
    resource_group_name = string
    vm_name             = string
    vm_username         = string
    vm_password         = string
    source_image_reference = object({
      vm_publisher = string
      vm_offer     = string
      vm_sku       = string
      vm_version   = string
    })
  }))

}

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