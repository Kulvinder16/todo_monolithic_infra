resource_groups = {
  rg1 = {
    name       = "rg_1"
    location   = "Central India"
    managed_by = null
    tags = {
      environment = "production"
      owner       = "kulvinder"
    }
  }

  rg2 = {
    name     = "rg_2"
    location = "Central India"
    tags = {
      environment = "dev"
      department  = "IT"
    }
  }
}

storage_accounts = {
  s1 = {
    name                     = "stg15"
    resource_group_name      = "rg_1"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"

    tags = {
    environment = "dev" }
  }
  s2 = {
    name                     = "stg13"
    resource_group_name      = "rg_2"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"

    tags = {
    environment = "dev" }
  }
}

vnets = {
v1 = {
name                = "vnet1"
location            = "central India"
resource_group_name = "rg_1"
address_space       = ["10.0.0.0/16"]
dns_servers         = ["10.0.0.4", "10.0.0.5"]

subnets = [
{  name           = "subnet1"
  address_prefixes = ["10.0.1.0/24"]},
{
  name           = "subnet2"
  address_prefixes = ["10.0.2.0/24"]
}]
}
}

pip = {
  name = "todo_pip"
  resource_group_name = "rg_1"
  location = "central india"

}

