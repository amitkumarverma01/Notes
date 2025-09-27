terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
  backend "azurerm" {
    
  }

}

provider "azurerm" {
  # Configuration options
  features {}
  
  subscription_id = "177b7e12-5f03-4f63-bcd1-ed6d1d776bff"
}


resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}




resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space

}

resource "azurerm_subnet" "frontend_subnet" {
  name                 = var.fsub_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes

}


resource "azurerm_subnet" "backend_subnet" {
  name                 = var.bsub_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes1

}


