vsubnet = {
  vsubnet1 = {
    name                 = "vsubnet1"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.1.1.0/24"]
  }
  vsubnet2 = {
    name                 = "vsubnet2"
    resource_group_name  = "rg2"
    virtual_network_name = "vnet2"
    address_prefixes     = ["10.2.1.0/24"]
  }
}