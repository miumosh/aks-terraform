resource "azurerm_virtual_network" "main" {
  name                = "${var.env}-${local.service_name}-main-vnet"
  address_space       = [var.network.main.vnet]
  location            = azurerm_resource_group.all.location
  resource_group_name = azurerm_resource_group.all.name

  tags = {
    environment = var.env
  }
}