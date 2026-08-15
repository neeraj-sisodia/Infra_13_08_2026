variable "resource_group"{}
variable "storage_account"{}

module "resource_group"{
    source="../../modules/azurerm_resource_group"
    resource_group=var.resource_group
}

module "storage_account"{
    source="../../modules/azurerm_storage_account"
    storage_account=var.storage_account
}