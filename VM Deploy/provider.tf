# Configure the Azure provider

##################################################################################
# PROVIDERS
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.6.0"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
  }
  required_version = ">= 1.1.9"
}

provider "azurerm" {
  # Configuration options
  features {}
}

