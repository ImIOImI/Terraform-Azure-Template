
resource "azurerm_virtual_network" "base-vnet" {
  name                = "vnet-${var.env}-${var.location}-${var.instance}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "base-vnet-subnet" {
  count                = length(var.vnet_subnets)
  name                 = "snet-${var.vnet_subnets[count.index].name}"
  virtual_network_name = azurerm_virtual_network.base-vnet.name
  resource_group_name  = azurerm_virtual_network.base-vnet.resource_group_name
  address_prefix       = var.vnet_subnets[count.index].addr_prefix
}
