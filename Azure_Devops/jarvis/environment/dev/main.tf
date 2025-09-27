module "rg" {
  source               = "../../modules/resource_group"
  resource_group_name1 = "rg-dev-001"
  resource_group_name2 = "rg-dev-002"
  location             = "East US"

}

module "vnet" {
  source               = "../../modules/virtual_network"
  depends_on           = [module.rg]
  virtual_network_name = "vnet-dev-001"
  address_space        = ["192.168.2.0/24"]
  location             = "eastus"
  resource_group_name  = "rg-dev-001"
}


module "name" {
  source                = "../../modules/network_subnet"
  depends_on            = [module.rg, module.vnet]
  subnet_name1          = "subnet-dev-001"
  subnet_name2          = "subnet-dev-002"
  resource_group_name1  = "rg-dev-001"
  virtual_network_name1 = "vnet-dev-001"
  address_prefixes1     = ["192.168.2.0/25"]
  address_prefixes2     = ["192.168.2.128/25"]
}
