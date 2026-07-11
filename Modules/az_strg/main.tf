resource "azurerm_storage_account" "strg" {
  for_each = var.vstrg
  name                     = each.value.name
  resource_group_name      = each.vale.resource_group_name
  location                 = each.vale.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}