output "bastion_name" {
  value = azurerm_bastion_host.bastion.name
}

output "bastion_public_ip" {
  value = azurerm_public_ip.bastion_pip.ip_address
}

output "bastion_public_ip_id" {
  value = azurerm_public_ip.bastion_pip.id
}

output "bastion_id" {
  value = azurerm_bastion_host.bastion.id
}