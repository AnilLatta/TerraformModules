vnic = {
  vnic1 = {
    name                = "vnic1"
    location            = "japaneast"
    resource_group_name = "rg1"

    ip_configuration = {
      name                          = "ipconfig1"
      subnet_id                     = "/subscriptions/5763111c-28fc-4a01-97e4-3b5805a10876/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/vsubnet1"
      private_ip_address_allocation = "Dynamic"
    }
  }
  vnic2 = {
    name                = "vnic2"
    location            = "japanwest"
    resource_group_name = "rg2"

    ip_configuration = {
      name                          = "ipconfig2"
      subnet_id                     = "/subscriptions/5763111c-28fc-4a01-97e4-3b5805a10876/resourceGroups/rg2/providers/Microsoft.Network/virtualNetworks/vnet2/subnets/vsubnet2"
      private_ip_address_allocation = "Dynamic"
    }
  }
}