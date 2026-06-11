terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

provider "aci" {
  username = "ninliang"
  password = "Wmdsskr123."
  url      = "https://10.124.63.139"
}

module "aci" {
  source  = "netascode/nac-aci/aci"
  version = "0.9.1"

  yaml_directories = ["data"]

  manage_access_policies    = false
  manage_fabric_policies    = false
  manage_pod_policies       = false
  manage_node_policies      = false
  manage_interface_policies = false
  manage_tenants            = true
}
