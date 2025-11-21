variable "resource_groups" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}


variable "storage_accounts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
}

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
        kv_name = string
  location = string
  resource_group_name = string
    }
  ))
}