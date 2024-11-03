# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "=3.94.0"
#     }
#   }
# }

# # Configure the Microsoft Azure Provider
# provider "azurerm" {
#     features {}
# }

# Create Resource Group to create cluster on it
resource "azurerm_resource_group" "test-aks-cluster-rg" {
  name     = var.aks_resource_group_name
  location = var.location
}


# Create AKS Cluster in test-aks-cluster-rg
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.ask_cluster_name
  location            = azurerm_resource_group.test-aks-cluster-rg.location
  resource_group_name = azurerm_resource_group.test-aks-cluster-rg.name
  dns_prefix          = "mytestakscluster"

  default_node_pool {
    name       = "testnodepool"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

