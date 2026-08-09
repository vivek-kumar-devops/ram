resource "azurerm_network_interface" "asd" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
  location            = var.location_name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.snet_id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "vms" {

  name                = var.vm1_name
  resource_group_name = var.resource_group_name
  location            = var.location_name
  size                = "Standard_DC1s_v3"

  admin_username = "azureuser"

  network_interface_ids = [azurerm_network_interface.asd.id]

  admin_password                  = "Password@1234"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


