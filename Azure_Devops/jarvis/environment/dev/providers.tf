terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "jarvis"
    storage_account_name  = "jarvisstorageaccount001"
    container_name        = "jarvis"
    key                   = "dev.terraform.tfstate"
    
  }
}

provider "azurerm" {
    features {}
    subscription_id = "177b7e12-5f03-4f63-bcd1-ed6d1d776bff"
}