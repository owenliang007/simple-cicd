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

locals {

  config = yamldecode(
    file("${path.module}/../data/tenant.yaml")
  )
}

resource "aci_tenant" "tenant" {

  name = local.config.tenant.name
}
