terragrunt_version_constraint = "~> 0.63.1"

locals {
  subscription_id = get_env("ARM_SUBSCRIPTION_ID")
  tenant_id       = get_env("ARM_TENANT_ID")
  client_id       = get_env("ARM_CLIENT_ID")
  client_secret   = get_env("ARM_CLIENT_SECRET")
}

remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    subscription_id      = "${local.subscription_id}"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
    resource_group_name  = "rg-nytes1-tfstate-dv-je"
    storage_account_name = "stnytes1tfstatedvje"
    container_name       = "terraform"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "= 3.71.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "${local.subscription_id}"
  tenant_id       = "${local.tenant_id}"
  client_id       = "${local.client_id}"
  client_secret   = "${local.client_secret}"

  features {}
}
EOF
}
