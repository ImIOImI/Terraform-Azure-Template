
resource "azurerm_virtual_network" "base-vnet" {
  name                = "vnet-${var.env}-${var.location}-${var.instance}"
  resource_group_name = var.rg_name
  location            = var.rg_location
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "base-vnet-gateway-subnet" {
  name                 = "GatewaySubnet"
  virtual_network_name = azurerm_virtual_network.base-vnet.name
  resource_group_name  = azurerm_virtual_network.base-vnet.resource_group_name
  address_prefix       = var.vnet_gateway_address_space
}

resource "azurerm_subnet" "base-vnet-subnets" {
  count                = length(var.vnet_subnets)
  name                 = "snet-${var.vnet_subnets[count.index].name}"
  virtual_network_name = azurerm_virtual_network.base-vnet.name
  resource_group_name  = azurerm_virtual_network.base-vnet.resource_group_name
  address_prefix       = var.vnet_subnets[count.index].addr_prefix
}
