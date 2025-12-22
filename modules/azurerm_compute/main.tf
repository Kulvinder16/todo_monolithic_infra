data "azurerm_subnet" "s_net" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.v_net_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_key_vault" "kv" {
  for_each            = var.vms
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "kv_secret_username" {
  for_each     = var.vms
  name         = each.value.vm_username
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "kv_secret_password" {
  for_each     = var.vms
  name         = each.value.vm_password
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_public_ip" "pip" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface" "nic_infra" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    subnet_id                     = data.azurerm_subnet.s_net[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "virtual_machines" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.vm_size
  disable_password_authentication = false
  admin_username                  = data.azurerm_key_vault_secret.kv_secret_username[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.kv_secret_password[each.key].value
  network_interface_ids = [
    azurerm_network_interface.nic_infra[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.source_image_reference.vm_publisher
    offer     = each.value.source_image_reference.vm_offer
    sku       = each.value.source_image_reference.vm_sku
    version   = each.value.source_image_reference.vm_version
  }

}