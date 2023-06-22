terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.61.0"
    }
  }
}

provider "azurerm" {
    #subscription_id = "a0ce939f-c05c-4bdd-9b6a-7c27ca803b75"
    #client_id = "2b566da7-88cb-4527-bea4-9eaaa8fce793"
    #client_secret = "Z1r8Q~wxEChaiZvoVojpAQXWCMByHKz3F1Zf1cK9"
    #tenant_id = "04d6c38f-d878-4be3-8309-15eb297cacb4"
    features {}
    skip_provider_registration = true
}