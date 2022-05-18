
##################################################################################
# RESOURCE GROUP
##################################################################################

resource "azurerm_resource_group" "rg-avd" {
  name     = var.avd_rg_name
  location = var.avd_rg_location
    tags = {
     Environment = "AVD Terraform Test"
     Team = "DevOps"
   }
}

##################################################################################
# Log Analytics Workspace
##################################################################################

#resource "azurerm_resource_group" "rg-law" {
#  name     = var.law_resource_group_name
#  location = "eastus"
#    tags = {
#     Environment = "AVD Terraform Test"
#     Team = "DevOps"
#   }
#}

#data "azurerm_log_analytics_workspace" "law" {
#    name = "law-hub-inet-01"
#    location = azurerm_resource_group.rg-law.location
#    resource_group_name = azurerm_resource_group.rg-law.name
#}

##################################################################################
# Create Virtual Network
##################################################################################
resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name
    address_space       = var.vnet_address_space
    location            = azurerm_resource_group.rg-avd.location
    resource_group_name = azurerm_resource_group.rg-avd.name
    tags = {
    environment = "AVD Terraform test"
    Team = "DevOps"
  }
}

resource "azurerm_subnet" "defaultSubnet" {
  name           = "AVDSubnet"
  resource_group_name = azurerm_resource_group.rg-avd.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.vnet_avd_subnet
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.vnet_nsg_name
  location            = azurerm_resource_group.rg-avd.location
  resource_group_name = azurerm_resource_group.rg-avd.name
  security_rule {
    name                       = "allow-rdp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 3389
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.defaultSubnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

##################################################################################
# Create AVD Workspace
##################################################################################

resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                =  var.workspace
  location            =  var.deploy_location
  resource_group_name = azurerm_resource_group.rg.name
  friendly_name       = "${var.prefix} Workspace"
  description         = "${var.prefix} Workspace"
}

##################################################################################
# Create AVD
##################################################################################



depends_on          = [azurerm_virtual_desktop_host_pool.hostpool,azurerm_virtual_desktop_workspace.workspace]