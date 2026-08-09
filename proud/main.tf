module "resource_group" {
  source        = "../modules/azurerm_resource_group"
  rg1_name      = var.resource_group
  location_name = var.location_name
}
module "virtual_network" {
  depends_on          = [module.resource_group]
  source              = "../modules/azurerm_virtual_network"
  vnet_name           = var.tina_name
  resource_group_name = var.resource_group
  location_name       = var.location_name
}
module "subnet" {
  depends_on          = [module.virtual_network]
  source              = "../modules/azurerm_subnet"
  snet_name           = var.sima_name
  resource_group_name = var.resource_group
  reenu_name          = var.tina_name
}
module "vm"{
  depends_on          = [module.subnet]
  source              = "../modules/azurerm_network_interface"
  nic_name            = var.nic1_name
  resource_group_name = var.resource_group
  location_name       = var.location_name
  snet_id             = module.subnet.subnet_id

  vm1_name            = var.vm1_name
   
}
