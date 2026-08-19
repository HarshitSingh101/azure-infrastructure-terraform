terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstateharshit2026"
    container_name       = "tfstate"
    key                  = "real-project.tfstate"

    use_azuread_auth = true
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

provider "tls" {}