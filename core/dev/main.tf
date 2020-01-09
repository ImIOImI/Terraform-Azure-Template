locals {
  subnet_cidrs = cidrsubnets(var.vnet_cidr_block[0], 8, 4, 4)
  hub_subnets = [{
    name = "mgmt"
    addr_prefix = local.subnet_cidrs[1] },
    { name = "dmz"
    addr_prefix = local.subnet_cidrs[2] }
  ]
}

resource "azurerm_resource_group" "core-dev-rg" {
  name     = "rg-${var.service_name}-${var.env}-${var.location}-${var.instance}"
  location = var.location
}
module "hub-vnet" {
  source                     = "../../Modules/Network/virtual-networks/basic-gateway"
  prefix                     = var.prefix
  env                        = var.env
  location                   = var.location
  instance                   = var.instance
  rg_name                    = azurerm_resource_group.core-dev-rg.name
  rg_location                = azurerm_resource_group.core-dev-rg.location
  vnet_address_space         = var.vnet_cidr_block
  vnet_gateway_address_space = local.subnet_cidrs[0]
  vnet_subnets               = local.hub_subnets
}