module "test-aks-module" {
  source= "./test-aks-module"
  location = "West Europe"
  aks_resource_group_name = "test-aks-cluster-rg"
  ask_cluster_name = "test-aks-cluster"
}