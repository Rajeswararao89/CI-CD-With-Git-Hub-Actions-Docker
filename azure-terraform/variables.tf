variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group"
  default     = "elevate-pro-cicd-rg"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "eastus"
}

variable "container_app_name" {
  type        = string
  description = "Name of the Azure Container App"
  default     = "elevate-pro-cicd-app"
}

variable "docker_image" {
  type        = string
  description = "Docker image to deploy"
  default     = "rajeswararao89/elevate-pro-cicd:latest"
}

