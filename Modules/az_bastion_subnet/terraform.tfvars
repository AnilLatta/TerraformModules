vbassub = {
  vbassub1 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "bastionrg"
    virtual_network_name = "vnetbastion"
    address_prefixes     = ["10.3.1.0/24"]
  }
}