# Configure the Azure provider

##################################################################################
# PROVIDERS
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}