# Terraform backend configuration to use Azure Blob Storage for storing tfstate
terraform {
  backend "azurerm" {
    resource_group_name   = "test-tf-storage-rg"
    storage_account_name  = "testtfstatefilestorage"
    container_name        = "testtfstate-storage-container"
    key                   = "terraform.tfstate"
  }
}