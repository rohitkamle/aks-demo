
resource "azurerm_kubernetes_cluster" "aks" {
    name                = var.aks_name
    location            = var.location
    resource_group_name = var.rg_name
    dns_prefix          = "dephi"

    linux_profile {
        admin_username = "aksadmin"
        ssh_key {
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJnxufXz/T8iS2Nu39RleNDAsidu+Kn0A4q8qf5xsinGW7YZc6qDhtzOmCI1JXHKDWPzOK+0MN0ljt26BvH+ahxULNyjtO2DgJYD975Rlt3OvZdWoeR0Hf5E5VT1OZjBA0fHt9PH5Vte/yMUDfMg+psqoVw3QiLLTTFvoq+D8ESjedU4eDntGVm2hB78ZHUeICBAYU6rVclMjc1KOJEeWVMlC6RjCXcZIBZsYo+jWBHA1YEtCneK5lZQFgrcdpsiNis7n2319Sg4QI5DJn6KPGU1+HNrm+5XYDZkQubSIamtZcLu6y7m3TpitKUu4V67tMM+Gz3BYwZZ/o7DPbzpS5 jenkinsuser@vmjenkins001"
        }
    }
    default_node_pool {
        name            = "agentpool"
        node_count      = var.aks_node_count
        vm_size         = var.aks_node_size
        type            = "VirtualMachineScaleSets"
        max_pods        = "250" 
        vnet_subnet_id = var.snet_id
    }

  
  identity {
    type = "SystemAssigned"
  }
    role_based_access_control {
    enabled = true
    }

    tags = {
        Environment = "demo"
    }
  network_profile {
          dns_service_ip     = "10.0.0.10"
          docker_bridge_cidr = "172.17.0.1/16"
          load_balancer_sku  = "standard"
          network_plugin     = "azure"
          network_policy     = "calico"
          #outbound_type      = (known after apply)
          #pod_cidr           = (known after apply)
          service_cidr       = "10.0.0.0/16"
        }



} 



