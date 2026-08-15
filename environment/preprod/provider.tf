terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "<RESOURCE_GROUP_NAME>"
    storage_account_name = "<STORAGE_ACCOUNT_NAME>"
    container_name       = "tfstate"
    key                  = "preprod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "cacae4fb-1d94-4b34-bb54-e94c77b6941c"
}
