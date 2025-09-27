variable "rg_name" {
  description = "A map of child resource groups to create."
  type = string
}

variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
  
}

variable "vnet_name" {
  description = "A map of child virtual networks to create."
  type = string
  
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  
}

variable "fsub_name" {
  description = "The name of the subnet."
  type        = string
  
}

variable "bsub_name" {
  description = "The name of the subnet."
  type        = string
  
}


variable "address_prefixes" {
  description = "The address space for the virtual network."
  type        = list(string)  
  
}


variable "address_prefixes1" {
  description = "The address space for the virtual network."
  type        = list(string)  
  
}
