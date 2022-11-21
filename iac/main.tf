# Create the resource group
resource "azurerm_resource_group" "solyticrg" {
  name     = var.resource_group_name
  location = var.location
}

# Create the container registry to host docker image
resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = azurerm_resource_group.solyticrg.name
  location            = azurerm_resource_group.solyticrg.location
  sku                 = "Standard"
  admin_enabled       = true
}
