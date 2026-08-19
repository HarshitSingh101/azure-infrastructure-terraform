terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "sttfstateharshit2026"
    container_name       = "tfstate"
    key                  = "real-project.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

provider "tls" {}