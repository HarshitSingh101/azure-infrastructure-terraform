output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "web_subnet_id" {
  value = azurerm_subnet.web.id
}

output "web_subnet_name" {
  value = azurerm_subnet.web.name
}

output "bastion_subnet_id" {
  value = azurerm_subnet.bastion.id
}

output "vm_public_ip_id" {
  value = var.public_ip_name != null ? azurerm_public_ip.vm_pip[0].id : null
}

output "public_ip_name" {
  value = var.public_ip_name != null ? azurerm_public_ip.vm_pip[0].name : null
}