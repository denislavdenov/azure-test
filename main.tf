provider "azurerm" {

  version = "=2.14.0"

}

resource "azurerm_resource_group" "denov-rg" {
  name     = "chavo-resources"
  location = "West US 2"
}
resource "azurerm_virtual_network" "main-denov" {
  name                = "chavo-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.denov-rg.location}"
  resource_group_name = "${azurerm_resource_group.denov-rg.name}"
}
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.denov-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.main-denov.name}"
  address_prefix       = "10.0.2.0/24"
}