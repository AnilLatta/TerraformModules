#az_rg
vrgs = {
  rgs1 = {
    name     = "rg1"
    location = "japaneast"
  }
  rgs2 = {

    name     = "rg2"
    location = "japanwest"
  }
  rgs3 = {

    name     = "bastionrg"
    location = "centralindia"
  }
}

#az_vnet
vnet = {
  vnet1 = {
    name                = "vnet1"
    location            = "japaneast"
    resource_group_name = "rg1"
    address_space       = ["10.1.0.0/16"]
  }
  vnet2 = {
    name                = "vnet2"
    location            = "japanwest"
    resource_group_name = "rg2"
    address_space       = ["10.2.0.0/16"]
  }
  vnet3 = {
    name                = "vnetbastion"
    location            = "centralindia"
    resource_group_name = "bastionrg"
    address_space       = ["10.3.0.0/16"]
  }
}

#az_subnet

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

#az_nsg

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

#az_nic
vnic = {
  vnic1 = {
    name                = "vnic1"
    location            = "japaneast"
    resource_group_name = "rg1"

    ip_configuration = {
      name                          = "ipconfig1"
      subnet_id                     = "/subscriptions/3c54d768-1375-4b24-9f97-79819d9d0e13/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/vsubnet1"
      private_ip_address_allocation = "Dynamic"
    }
  }
  vnic2 = {
    name                = "vnic2"
    location            = "japanwest"
    resource_group_name = "rg2"

    ip_configuration = {
      name                          = "ipconfig2"
      subnet_id                     = "/subscriptions/3c54d768-1375-4b24-9f97-79819d9d0e13/resourceGroups/rg2/providers/Microsoft.Network/virtualNetworks/vnet2/subnets/vsubnet2"
      private_ip_address_allocation = "Dynamic"
    }
  }
}

# az_association
vasso = {
  vasso1 = {
    subnet_id                 = "/subscriptions/3c54d768-1375-4b24-9f97-79819d9d0e13/resourceGroups/rg1/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/vsubnet1"
    network_security_group_id = "/subscriptions/3c54d768-1375-4b24-9f97-79819d9d0e13/resourceGroups/rg1/providers/Microsoft.Network/networkSecurityGroups/nsg1"
  }
  vasso2 = {
    subnet_id                 = "/subscriptions/3c54d768-1375-4b24-9f97-79819d9d0e13/resourceGroups/rg2/providers/Microsoft.Network/virtualNetworks/vnet2/subnets/vsubnet2"
    network_security_group_id = "/subscriptions/3c54d768-1375-4b24-9f97-79819d9d0e13/resourceGroups/rg2/providers/Microsoft.Network/networkSecurityGroups/nsg2"
  }
}

#az_bastion_subnet
vbassub = {
  vbassub1 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "bastionrg"
    virtual_network_name = "vnetbastion"
    address_prefixes     = ["10.3.1.0/24"]
  }
}

#az_publicip
vpip = {
  vpip1 = {
    name                = "bastionpip"
    location            = "centralindia"
    resource_group_name = "bastionrg"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
# az_bastion

vmbastion = {
  vmbastion1 = {
    name                = "vmbastion12"
    location            = "centralindia"
    resource_group_name = "bastionrg"

    ip_configuration = {
      name                 = "Bastionip"
      subnet_id            = "/subscriptions/3c54d768-1375-4b24-9f97-79819d9d0e13/resourceGroups/bastionrg/providers/Microsoft.Network/virtualNetworks/vnetbastion/subnets/AzureBastionSubnet"
      public_ip_address_id = "/subscriptions/3c54d768-1375-4b24-9f97-79819d9d0e13/resourceGroups/bastionrg/providers/Microsoft.Network/publicIPAddresses/bastionpip"
    }
  }
}

#az win
vmwin = {
  vmwin1 = {
    name                  = "vmwin1"
    resource_group_name   = "rg1"
    location              = "japaneast"
    size                  = "Standard_D2_v5"
    admin_username        = "adminuser"
    admin_password        = "P@$$w0rd1234!"
    network_interface_ids = ["/subscriptions/3c54d768-1375-4b24-9f97-79819d9d0e13/resourceGroups/rg1/providers/Microsoft.Network/networkInterfaces/vnic1",]

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
  }
}

#az linux
vmlinux = {
  vmlinux1 = {
    name                  = "vmlinux"
    resource_group_name   = "rg2"
    location              = "japanwest"
    size                  = "Standard_D2_v5"
    admin_username        = "adminuser"
    admin_password        = "P@$$w0rd1234!"
    disable_password_authentication = false
    network_interface_ids = ["/subscriptions/3c54d768-1375-4b24-9f97-79819d9d0e13/resourceGroups/rg2/providers/Microsoft.Network/networkInterfaces/vnic2",]

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}






