terraform {

  required_providers {

    aci = {
      source  = "CiscoDevNet/aci"
      version = ">= 2.19.0"
    }

    utils = {
      source  = "netascode/utils"
      version = "2.0.0"
    }

    local = {
      source  = "hashicorp/local"
      version = ">= 2.5.1"
    }
  }
}

provider "aci" {

  username = var.apic_username

  password = var.apic_password

  url = var.apic_url

  insecure = true
}

module "aci" {

  source = "../terraform-aci-nac-aci"

  yaml_directories = ["../data"]

  manage_access_policies   = false
  manage_fabric_policies   = false
  manage_pod_policies      = false
  manage_node_policies     = false
  manage_interface_policies = false
  manage_tenants           = true
}
