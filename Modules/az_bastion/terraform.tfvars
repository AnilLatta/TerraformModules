vmbastion = {
  vmbastion1 = {
    name                = "vmbastion12"
    location            = "centralindia"
    resource_group_name = "bastionrg"

    ip_configuration = {
      name                 = "Bastionip"
      subnet_id            = "/subscriptions/5763111c-28fc-4a01-97e4-3b5805a10876/resourceGroups/bastionrg/providers/Microsoft.Network/virtualNetworks/vnetbastion/subnets/AzureBastionSubnet"
      public_ip_address_id = "/subscriptions/5763111c-28fc-4a01-97e4-3b5805a10876/resourceGroups/bastionrg/providers/Microsoft.Network/publicIPAddresses/bastionpip"
    }
  }
}