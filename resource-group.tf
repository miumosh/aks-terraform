resource azurerm_resource_group all {
  name     = "${var.env}-${local.service_name}-rg"
  location = local.region

  tags = {
    environment = var.env
  }
}
