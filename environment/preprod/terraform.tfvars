resource_group={
    rg1={
    name="rg-preprod"
    location="east us"
    }
      rg2={
        name="rg-ajadi"
        location="central india"
    }

}
storage_account={
    sa1={
        name                     ="stpreprod"
  resource_group_name      = "rg-preprod"
  location                 = "east us"
  account_tier             = "Standard"
  account_replication_type = "GRS"

    }
}