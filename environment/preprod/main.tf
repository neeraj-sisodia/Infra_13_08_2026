variable "resource_group"{}
variable "storage_account"{}

module "azurerm_resource_group" {
    source="../../modules/azurerm_resource_group"
    resource_group=var.resource_group
}

module "azurerm_storage_account"{
    source="../../modules/azurerm_storage_account"
    storage_account=var.storage_account
}