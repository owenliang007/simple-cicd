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
source = "git::https://github.com/netascode/terraform-aci-nac-aci.git?ref=v0.9.1"
yaml_directories = ["../data"]
}

