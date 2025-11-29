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

}

storage_accounts = {
  s1 = {
    name                     = "stg16"
    resource_group_name      = "rg_1"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"

    tags = {
    environment = "dev" }
  }}

vnets = {
  v1 = {
    name                = "vnet1"
    location            = "central India"
    resource_group_name = "rg_1"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      { name = "frontend-subnet-16"
      address_prefixes = ["10.0.1.0/24"] },
      {
        name             = "backend-subnet-16"
        address_prefixes = ["10.0.2.0/24"]
    }]
  }
}

pip = {
  pip1 = {
    name                = "frontend_pip_16"
    resource_group_name = "rg_1"
    location            = "central india"
    allocation_method   = "Static"
    tags = {
      app = "frontend16"
      environment = "dev"
    }
  }
    pip2 = {
    name                = "backend_pip_16"
    resource_group_name = "rg_1"
    location            = "central india"
    allocation_method   = "Static"
    tags = {
      app = "backend16"
      environment = "dev"
    }
  }
}


kv = {
kv1 = {
  kv_name = "key-1"
  location = "central india"
  resource_group_name = "rg_1"
  sp_object_id = "92bb784a-716c-4200-8483-9303ecb16df2" 
}
}