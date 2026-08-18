resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = var.environment
  }
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "network" {
  source = "../../modules/network"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  web_subnet_name   = var.web_subnet_name
  web_subnet_prefix = var.web_subnet_prefix

  bastion_subnet_prefix = var.bastion_subnet_prefix

  public_ip_name = var.public_ip_name
}

module "security" {
  source = "../../modules/security"

  nsg_name              = var.nsg_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  bastion_subnet_prefix = var.bastion_subnet_prefix[0]
}

module "vm" {
  source = "../../modules/vm"

  nic_name       = var.nic_name
  vm_name        = var.vm_name
  vm_size        = var.vm_size
  admin_username = var.admin_username

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  subnet_id            = module.network.web_subnet_id
  public_ip_address_id = module.network.vm_public_ip_id
  nsg_id               = module.security.nsg_id

  public_key = tls_private_key.ssh_key.public_key_openssh
}

module "bastion" {
  source = "../../modules/bastion"

  public_ip_name = var.bastion_public_ip_name
  bastion_name   = var.bastion_name

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  subnet_id = module.network.bastion_subnet_id
}

module "key_vault" {
  source = "../../modules/key-vault"

  key_vault_name      = var.key_vault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = var.tenant_id
}

resource "azurerm_role_assignment" "vm_key_vault_secrets_user" {
  scope                = module.key_vault.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.vm.vm_principal_id
}

module "monitoring" {
  source = "../../modules/monitoring"

  workspace_name      = var.workspace_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dcr_name = var.dcr_name
  vm_id    = module.vm.vm_id

  action_group_name = var.action_group_name
  alert_name        = var.alert_name
  alert_email       = var.alert_email
}