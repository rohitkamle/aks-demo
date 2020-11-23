resource "azurerm_container_registry" "acr" {
  name                     = var.name
  resource_group_name      = var.rg_name
  location                 = var.location
  sku                      = "standard"

}