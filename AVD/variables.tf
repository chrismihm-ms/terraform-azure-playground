variable "prefix" {
  type        = string
  default     = "East US AVD"
  description = "prefix"
}

variable "workspace" {
  type        = string
  default     = "East US Desktops"
  description = "prefix"
}

variable "deploy_location" {
  type        = string
  default     = "eastus"
  description = "location"
}

variable "avd_rg_name" {
  type        = string
  default     = "rg-TF-AVD"
  description = "AVD Resource Group"
}

variable "avd_rg_location" {
  type        = string
  default     = "eastus"  
  description = "This is the AVD resource groups location"
}

variable "law_resource_group_name" {
  type        = string
  default     = "rg-hub-law"
  description = "Terraform AVD Resource Group"
}

variable "resource_prefix" {
  type        = string
  default     = "TF-"
  description = "location"
}

variable "host_pool_name" {
  type        = string
  default     = "hp-TF-"
  description = "location"
}

variable "vnet_name" {
  type        = string
  default     = "vnet-spoke-avd-01"
}
variable "vnet_nsg_name" {
  type        = string
  default     = "nsg-avd-snet"
}

variable "vnet_address_space" {
  type        = list
  default     = ["10.100.0.0/16"]
}

variable "vnet_avd_subnet" {
  type        = list
  default     = ["10.100.1.0/24"]
}

#variable "app_secret_key" {
# type        = string
#  description = "App Secret Key"
#  sensitive   = true
#}