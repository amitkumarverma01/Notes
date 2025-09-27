resource "azurerm_subnet" "sub1" {
  name                 = var.subnet_name1
  resource_group_name  = var.resource_group_name1
  virtual_network_name = var.virtual_network_name1
  address_prefixes     = var.address_prefixes1
  
}

resource "azurerm_subnet" "sub2" {
  name                 = var.subnet_name2
  resource_group_name  = var.resource_group_name1
  virtual_network_name = var.virtual_network_name1
  address_prefixes     = var.address_prefixes2
  
}


