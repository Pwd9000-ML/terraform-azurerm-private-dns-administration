terraform {
  #backend "azurerm" {}
  backend "local" { path = "terraform-test1.tfstate" }
}

provider "azurerm" {
  features {}
}

####################################################
# PRE-REQS (RG, Private DNS zones) to test against #
####################################################
### Resource group to deploy the private DNS zones into
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_private_dns_zone" "private_dns" {
  for_each            = toset(var.private_dns_zones)
  name                = each.key
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

##################################################
# MODULE TO TEST                                 #
##################################################
module "dns-records-administration-test" {
  for_each                 = { for each in var.dns_config.records : each.record_no => each }
  source                   = "../.."
  private_dns_zone_name    = each.value.zone_name
  private_dns_zone_rg      = each.value.resource_group_name
  private_dns_record_type  = each.value.records.record_type
  private_dns_record_name  = each.value.records.record_name
  private_dns_record_ttl   = each.value.records.ttl
  private_dns_record_value = each.value.records.record_value
  tags                     = var.tags
  depends_on               = [azurerm_private_dns_zone.private_dns]
}