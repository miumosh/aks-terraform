terraform {
  required_version = "= 1.4.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.40.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate23624"
    container_name       = "tfstate"
    key                  = "terraform.tfstate" # file name
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}