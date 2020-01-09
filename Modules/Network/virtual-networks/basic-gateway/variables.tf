variable "prefix" {
  description = "Prefix to add to naming convention"
  default     = ""
}

variable "env" {
  description = "Environment or Subscription Type that the vnet will be deployed too"
  default     = "dev"
}

variable "location" {
  description = "The Azure location where the Vnet will be created"
}

variable "instance" {
  description = "Instance count if more than one is needed"
  default     = "001"
}

variable "rg_name" {
  description = "Name of resource group to create the network in"
}

variable "rg_location" {
  description = "Location where the resource group is located"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The IP range for the vNet in Cidr "
  default     = ["10.0.0.1/16"]
}

variable "vnet_gateway_address_space" {
  description = "Gateway Subnet address space in cidr notation"
}

variable "vnet_subnets" {
  type = list(object({
    name        = string
    addr_prefix = string
  }))
  description = "A list of Subnet Names and address prefixes to create in the new VNet"
  default = [{
    name        = "internal"
    addr_prefix = "10.0.0.1/24"
  }]
}