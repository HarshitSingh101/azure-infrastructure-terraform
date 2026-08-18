output "nic_id" {
  value = azurerm_network_interface.nic.id
}

output "nic_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "vm_principal_id" {
  value = azurerm_linux_virtual_machine.vm.identity[0].principal_id
}