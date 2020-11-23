output "acr" {
  value = module.acr.name
}

output "name" {
  value = module.aks.name
}

output "kubelet_identity" {
  value = module.aks.kubelet_identity
}
