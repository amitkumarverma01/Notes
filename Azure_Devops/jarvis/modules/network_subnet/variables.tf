
variable "subnet_name1" {
  description = "The name of the first subnet."
  type        = string
  
}
variable "subnet_name2" {
  description = "The name of the second subnet."
  type        = string
  
}

variable "resource_group_name1" {
  description = "The name of the resource group in which to create the resources."
  type        = string
  
}

variable "virtual_network_name1" {
  description = "The name of the first virtual network."
  type        = string
  
}

variable "address_prefixes1" {
  description = "The address prefixes to use for the first subnet."
  type        = list(string)
  
}

variable "address_prefixes2" {
  description = "The address prefixes to use for the second subnet."
  type        = list(string)
  
}