resource "azurerm_virtual_network" "abc" {
    name=var.vnet_name
    location = var.location_name
    resource_group_name = var.resource_group_name
    address_space = ["10.0.0.0/16"]
  
}