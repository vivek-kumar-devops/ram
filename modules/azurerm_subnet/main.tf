resource "azurerm_subnet" "subnet"{
    name=var.snet_name
    resource_group_name = var.resource_group_name
    address_prefixes = ["10.0.1.0/24"]
virtual_network_name = var.reenu_name  
}