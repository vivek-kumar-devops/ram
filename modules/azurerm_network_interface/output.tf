output "nic_id"{
  value = azurerm_network_interface.asd.id
}
output "vm1_id"{
  value = azurerm_linux_virtual_machine.vms.id
}