resource "azurerm_resource_group" "vrgs" {
  for_each = var.vrgs
  name     = each.value.name
  location = each.value.location
}