# 🟦 NIC creation (dynamic + conditional)
resource "azurerm_network_interface" "nic" {
  for_each = var.vms

  name                = "${each.key}-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = [1] # only one, for demonstration of dynamic
    content {
      name                          = "ipconfig1"
      subnet_id                     = data.azurerm_subnet.subnet[each.key].id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    }
  }

  tags = each.value.tags
}

# 🟥 Linux VM creation
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = local.vms

  name                = "${each.key}-vm"
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "${each.key}-osdisk"
  }

  disable_password_authentication = try(each.value.disable_password_auth, true)

  dynamic "admin_ssh_key" {
    for_each = (try(each.value.ssh_public_key, null) != null) ? [each.value.ssh_public_key] : []
    content {
      username   = each.value.admin_username
      public_key = admin_ssh_key.value
    }
  }

  tags = each.value.tags
}