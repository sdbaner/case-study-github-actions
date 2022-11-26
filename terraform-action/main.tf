
# Create the Linux App Service Pricing Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = var.app_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "B1"
}



# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = var.web_app_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  https_only            = true
  client_affinity_enabled = true
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    
    # Settings for private Azure Container Registiry 
    DOCKER_REGISTRY_SERVER_URL      = "https://${azurerm_container_registry.acr.login_server}"
    DOCKER_REGISTRY_SERVER_USERNAME = azurerm_container_registry.acr.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD = azurerm_container_registry.acr.admin_password
  
  }
  identity {
    type = "SystemAssigned"
  }
  # Configure Docker Image to load on start
  site_config {
    always_on      = "true"

    application_stack {
      docker_image     = "${azurerm_container_registry.acr.login_server}/${var.registry_name}"
      docker_image_tag = var.tag_name
      dotnet_version   = "6.0"
    }
  }
}
