terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
backend "azurerm" {
    tenant_id            = "c3a55f95-a381-4915-a75d-0bfb1f99b220"  # Can also be set via `ARM_TENANT_ID` environment variable.
    subscription_id     = "c316f505-7597-4175-b5db-d2949009d506"  # Can also be set via `ARM_SUBSCRIPTION_ID` environment variable.
    storage_account_name = "rajajistorageaccount"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "rajajicontainer"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "testpipeline.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }

}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "c316f505-7597-4175-b5db-d2949009d506"
}


module "rg" {
  source      = "./modules/rg"
  rg_name     = "demo-rg"
  location    = "East US"
}

module "vnet" {
  source      = "./modules/vnet"
  rg_name     = module.rg.rg_name
  location    = module.rg.location
  vnet_name   = "demo-vnet"
  address_space = ["10.0.0.0/16"]
}

module "subnet" {
  source        = "./modules/subnet"
  rg_name       = module.rg.rg_name
  vnet_name     = module.vnet.vnet_name
  subnets = [
    { name = "subnet1", address_prefix = "10.0.1.0/24" },
    { name = "subnet2", address_prefix = "10.0.2.0/24" }
  ]
}

module "nsg" {
  source    = "./modules/nsg"
  rg_name   = module.rg.rg_name
  nsg_name  = "demo-nsg"
  location  = module.rg.location
}
