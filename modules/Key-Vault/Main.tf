resource "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = var.tenant_id
  sku_name  = "standard"

  purge_protection_enabled   = true
  soft_delete_retention_days = 7
}

resource "azurerm_key_vault_secret" "test_secret" {
  name         = "test-secret"
  value        = "terraform-learning-secret"
  key_vault_id = azurerm_key_vault.kv.id
}