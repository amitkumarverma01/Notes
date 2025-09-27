module "rg" {
  source               = "../../modules/resource_group"
  resource_group_name1 = "rg-prod-001"
  resource_group_name2 = "rg-prod-002"
  location             = "East US"

}

module "vnet" {
  source               = "../../modules/virtual_network"
  depends_on           = [module.rg]
  virtual_network_name = "vnet-prod-001"
  address_space        = ["192.168.2.0/24"]
  location             = module.rg.location
  resource_group_name  = module.rg.resource_group_name1
}


module "name" {
  source                = "../../modules/network_subnet"
  depends_on            = [module.rg, module.vnet]
  subnet_name1          = "subnet-prod-001"
  subnet_name2          = "subnet-prod-002"
  resource_group_name1  = module.rg.resource_group_name1
  virtual_network_name1 = module.vnet.virtual_network_name
  address_prefixes1     = ["192.168.2.0/25"]
  address_prefixes2     = ["192.168.2.128/25"]
}
