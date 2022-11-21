variable "location" {
  description = "Azure region"
  type        = string
  default     = "North Europe"
}


variable "resource_group_name" {
  description = "Name for the resource group"
  type        = string
  default     = "my-solytic-resources-ga"
}


variable "container_registry_name" {
  type        = string
  description = "Azure Container Registry Name"
  default     = "solyticwebappcrga"
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
