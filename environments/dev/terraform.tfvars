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
    name                     = "stg1990"
    resource_group_name      = "rg_1"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "GRS"

    tags = {
    environment = "dev" }
} }

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
      app         = "frontend16"
      environment = "dev"
    }
  }
  pip2 = {
    name                = "backend_pip_16"
    resource_group_name = "rg_1"
    location            = "central india"
    allocation_method   = "Static"
    tags = {
      app         = "backend16"
      environment = "dev"
    }
  }
}


kv = {
  kv1 = {
    kv_name             = "key-1"
    location            = "central india"
    resource_group_name = "rg_1"
  }
}


vms = {
  VM_1 = {
    subnet_name         = "frontend-subnet-16"
    v_net_name          = "vnet1"
    kv_name             = "key-1"
    vm_size             = "Standard_B2ats"
    nic_name            = "frontend_nic_16"
    location            = "central india"
    resource_group_name = "rg_1"
    vm_name             = "frontendvm-16"
    vm_username = "frontendVM"
    vm_password = "frontend-password"
    pip_name            = "frontend_pip_16"
    source_image_reference = {
      vm_publisher = "Canonical"
      vm_offer     = "0001-com-ubuntu-server-jammy"
      vm_sku       = "22_04-lts"
      vm_version   = "latest"
    }
  }

    VM_2 = {
    subnet_name         = "backend-subnet-16"
    v_net_name          = "vnet1"
    kv_name             = "key-1"
    vm_size             = "Standard_B2ats"
    nic_name            = "backend_nic_16"
    location            = "central india"
    resource_group_name = "rg_1"
    vm_name             = "backendvm-16"
    vm_username = "backendVM"
    vm_password = "backend-password"
    pip_name            = "backend_pip_16"
    source_image_reference = {
      vm_publisher = "Canonical"
      vm_offer     = "0001-com-ubuntu-server-jammy"
      vm_sku       = "22_04-lts"
      vm_version   = "latest"
    }
  }
}

sql_server = {
Server_1 = {
  kv_name = "key-1"
resource_group_name = "rg_1"
location = "Central India"
db_username = "db-username"
db_password = "db-password1"
server_name = "todo-infra-server"
}
}
