resource_group = {
  rg1 = {
    name     = "rg-prod"
    location = "east us"
  }
}
storage_account={
    sa1={
        name                     ="stpprod"
  resource_group_name      = "rg-prod"
  location                 = "east us"
  account_tier             = "Standard"
  account_replication_type = "GRS"

    }
}