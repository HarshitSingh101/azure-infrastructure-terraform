module "network" {
  source = "./modules/network"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  web_subnet_name   = var.web_subnet_name
  web_subnet_prefix = var.web_subnet_prefix

  bastion_subnet_prefix = var.bastion_subnet_prefix

  public_ip_name = var.public_ip_name
}

moved {
  from = azurerm_virtual_network.vnet
  to   = module.network.azurerm_virtual_network.vnet
}

moved {
  from = azurerm_subnet.web
  to   = module.network.azurerm_subnet.web
}

moved {
  from = azurerm_subnet.bastion
  to   = module.network.azurerm_subnet.bastion
}

moved {
  from = azurerm_public_ip.vm_pip
  to   = module.network.azurerm_public_ip.vm_pip
}

module "security" {
  source = "./modules/security"

  nsg_name              = var.nsg_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  bastion_subnet_prefix = var.bastion_subnet_prefix[0]
}

moved {
  from = azurerm_network_security_group.web_nsg
  to   = module.security.azurerm_network_security_group.web_nsg
}

moved {
  from = azurerm_network_security_rule.allow_http
  to   = module.security.azurerm_network_security_rule.allow_http
}

module "vm" {
  source = "./modules/vm"

  nic_name             = var.nic_name
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  subnet_id            = module.network.web_subnet_id
  public_ip_address_id = module.network.vm_public_ip_id
  nsg_id               = module.security.nsg_id
  public_key           = tls_private_key.ssh_key.public_key_openssh
}

moved {
  from = azurerm_network_interface.nic
  to   = module.vm.azurerm_network_interface.nic
}

moved {
  from = azurerm_network_interface_security_group_association.nic_nsg
  to   = module.vm.azurerm_network_interface_security_group_association.nic_nsg
}

moved {
  from = azurerm_linux_virtual_machine.vm
  to   = module.vm.azurerm_linux_virtual_machine.vm
}

module "bastion" {
  source = "./modules/bastion"

  public_ip_name      = "pip-bastion"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  bastion_name        = "bastion-host"
  subnet_id           = module.network.bastion_subnet_id
}

moved {
  from = azurerm_public_ip.bastion_pip
  to   = module.bastion.azurerm_public_ip.bastion_pip
}

moved {
  from = azurerm_bastion_host.bastion
  to   = module.bastion.azurerm_bastion_host.bastion
}