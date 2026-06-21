vmlinux = {
  vmlinux = {
    name                  = "vmlinux"
    resource_group_name   = "rg2"
    location              = "japanwest"
    size                  = "Standard_D2_v5"
    admin_username        = "adminuser"
    network_interface_ids = "/subscriptions/5763111c-28fc-4a01-97e4-3b5805a10876/resourceGroups/rg2/providers/Microsoft.Network/networkInterfaces/vnic2"

    # admin_ssh_key = {
    # username   = "adminuser"
    # public_key = file("~/.ssh/id_rsa.pub")
    #}

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