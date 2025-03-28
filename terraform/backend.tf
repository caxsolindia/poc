terraform {
  backend "azurerm" {
    resource_group_name   = "test-rg11"
    storage_account_name  = "testpavansa"
    container_name        = "caxakasmainpavan"
    key                   = "terraform.tfstate"
  }
}
