provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "secure-aks-cluster"
  location            = "East US"
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "secureaks"

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }
}
