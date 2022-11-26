variable "location" {
  description = "Azure region"
  type        = string
  default     = "North Europe"
}


variable "resource_group_name" {
  description = "Name for the resource group"
  type        = string
  default     = "my-solytic-resources"
}


#variable "container_registry_name" {
#  type        = string
#  description = "Azure Container Registry Name"
#  default     = "solyticwebappcr"
#}


#variable "container_registry_name" {
#  type        = string
#  description = "Azure Container Registry Name"
#  default     = "solyticwebappcr"
#}


variable "container_registry_name" {
  type        = string
  description = "Azure Container Registry Name"
  default     = "solyticwebappcr"
}




variable "app_plan_name" {
  type        = string
  description = "Azure App Service Pricing Plan Name"
  default     = "webapp-asp-solytic"
}


variable "web_app_name" {
  type        = string
  description = "Azure Web App Name"
  default     = "MySolyticWebApp1"
}


variable "registry_name" {
  type        = string
  description = "Azure Web App Name"
  default     = "myapp"
}


variable "tag_name" {
  type        = string
  description = "Tag for docker image"
  default     = "latest"
}
