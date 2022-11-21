terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "tfstate-ga"
        storage_account_name = "tfstatestoragega"
        container_name       = "admin"
        key                  = "terraform.tfstate"
    }

}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "cd7139c4-b340-4f83-860b-cacf8298ca45"
}
