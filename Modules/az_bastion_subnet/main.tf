resource "azurerm_subnet" "basssub" {
  for_each             = var.vbassub
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}
