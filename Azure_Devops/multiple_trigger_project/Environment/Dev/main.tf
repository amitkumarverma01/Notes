module "rg" {
  source   = "../../Module/azurerm_resource_group"
  rg_name  = "varddha-rg001"
  location = "centralindia"
}

module "vnet" {
  source        = "../../module/azurerm_virtual_network"
  depends_on    = [module.rg]
  vnet_name     = "varddha-vnet001"
  address_space = ["192.168.4.0/24"]
  rg_name       = "varddha-rg001"
  location      = "centralindia"

}

module "subnet" {
  source            = "../../module/azurerm_subnet"
  depends_on        = [module.vnet]
  fsub_name         = "Khanshaar-Frontend"
  rg_name           = "varddha-rg001"
  address_prefixes  = ["192.168.4.0/26"]
  vnet_name         = "varddha-vnet001"
  bsub_name         = "Khanshaar-Backend"
  address_prefixes1 = ["192.168.4.64/26"]
}
module "pip" {
  source   = "../../module/public_ip"
  pip      = "varddha-pip001"
  rg_name  = "varddha-rg001"
  location = "centralindia"
}
