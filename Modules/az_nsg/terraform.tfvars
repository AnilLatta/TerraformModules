vnsg = {
  vnsg1 = {
    name                = "nsg1"
    location            = "japaneast"
    resource_group_name = "rg1"

    security_rule = {
      name                       = "rule1"
      priority                   = 104
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  vnsg2 = {
    name                = "nsg2"
    location            = "japanwest"
    resource_group_name = "rg2"

    security_rule = {
      name                       = "rule2"
      priority                   = 105
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

