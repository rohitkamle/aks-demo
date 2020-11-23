module "rg" {
    source = "./module/rg"
    name = "delphi-demo-uaenorth-rg"
    location = "uaenorth"
}

module "acr" {
    source = "./module/acr"
    name = "delphidemouaenorthacr"
    rg_name = module.rg.name
    location = "uaenorth"
}

module "vnet" {
    source = "./module/vnet"
    vnet_name = "delphi-demo-uaenorth-vnet"
    rg_name = module.rg.name
    vnet_cidr = "10.1.0.0/16"
    location = "uaenorth"
}


module "snet" {
    source = "./module/snet"
    snet_name = "delphi-demo-uaenorth-snet"
    rg_name = module.rg.name
    snet_cidr = "10.1.0.0/18"
    vnet_name = module.vnet.name
}


module "aks" {
    source = "./module/aks"
    rg_name = module.rg.name
    location = "uaenorth"
    aks_name = "delphi-demo-uaenorth-aks"
    aks_node_count = "2"
    aks_node_size = "Standard_B2s"
    snet_id = module.snet.id

}


resource "azurerm_role_assignment" "aks_to_acr" {
  scope                = module.acr.id
  role_definition_name = "AcrPull"
  principal_id         = module.aks.kubelet_identity[0].object_id
}


