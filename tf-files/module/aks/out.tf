output "name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kubelet_identity" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity
}
