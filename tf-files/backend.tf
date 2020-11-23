terraform {   
 backend "azurerm" {
     storage_account_name = "dephidemouaenorthsa"
     container_name = "statedata"
     key = "terraform.tfstate"
     access_key = "MHaOg1opAt1S1E/wJ4L421sNy9OOFuKTEvvichiqFXTTXhMz5CljOoKl81/AOh/6+HeJQbhpqNQg6mSOBzABvQ=="
 } 
}