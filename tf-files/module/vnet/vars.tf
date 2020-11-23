
variable "vnet_name" {
    type = string
    description = "Azure Service account of terraform File execution"
    default =  ""
}

variable "vnet_cidr" {
  type = string
}

variable "rg_name" {
  type = string
}


variable "location" {
  type = string
}

