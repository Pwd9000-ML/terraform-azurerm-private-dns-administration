terraform {
  backend "azurerm" {}
  #backend "local" { path = "terraform-test1.tfstate" }
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
# Administer A records example
module "dns-a-records-administration-test" {
  for_each                 = { for each in var.dns_a_records : "${each.record_type}-${each.record_no}" => each }
  source                   = "../.."
  private_dns_zone_name    = each.value.zone_name
  resource_group_name      = each.value.resource_group_name
  private_dns_record_type  = each.value.record_type
  private_dns_record_ttl   = each.value.ttl
  private_dns_record_name  = each.value.record_name
  private_dns_record_value = each.value.record_value
  tags                     = var.tags
  depends_on               = [azurerm_private_dns_zone.private_dns]
}

# Administer AAAA records example
module "dns-aaaa-records-administration-test" {
  for_each                 = { for each in var.dns_aaaa_records : "${each.record_type}-${each.record_no}" => each }
  source                   = "../.."
  private_dns_zone_name    = each.value.zone_name
  resource_group_name      = each.value.resource_group_name
  private_dns_record_type  = each.value.record_type
  private_dns_record_ttl   = each.value.ttl
  private_dns_record_name  = each.value.record_name
  private_dns_record_value = each.value.record_value
  tags                     = var.tags
  depends_on               = [azurerm_private_dns_zone.private_dns]
}

# Administer PTR records example
module "dns-ptr-records-administration-test" {
  for_each                 = { for each in var.dns_ptr_records : "${each.record_type}-${each.record_no}" => each }
  source                   = "../.."
  private_dns_zone_name    = each.value.zone_name
  resource_group_name      = each.value.resource_group_name
  private_dns_record_type  = each.value.record_type
  private_dns_record_ttl   = each.value.ttl
  private_dns_record_name  = each.value.record_name
  private_dns_record_value = each.value.record_value
  tags                     = var.tags
  depends_on               = [azurerm_private_dns_zone.private_dns]
}

# Administer CNAME records example
module "dns-cname-records-administration-test" {
  for_each                 = { for each in var.dns_cname_records : "${each.record_type}-${each.record_no}" => each }
  source                   = "../.."
  private_dns_zone_name    = each.value.zone_name
  resource_group_name      = each.value.resource_group_name
  private_dns_record_type  = each.value.record_type
  private_dns_record_ttl   = each.value.ttl
  private_dns_record_name  = each.value.record_name
  private_dns_record_value = each.value.record_value
  tags                     = var.tags
  depends_on               = [azurerm_private_dns_zone.private_dns]
}

# Administer MX records example
module "dns-mx-records-administration-test" {
  for_each                 = { for each in var.dns_mx_records : "${each.record_type}-${each.record_no}" => each }
  source                   = "../.."
  private_dns_zone_name    = each.value.zone_name
  resource_group_name      = each.value.resource_group_name
  private_dns_record_type  = each.value.record_type
  private_dns_record_ttl   = each.value.ttl
  private_dns_record_name  = each.value.record_name
  private_dns_record_value = each.value.record_value
  tags                     = var.tags
  depends_on               = [azurerm_private_dns_zone.private_dns]
}

# Administer SRV records example
module "dns-srv-records-administration-test" {
  for_each                 = { for each in var.dns_srv_records : "${each.record_type}-${each.record_no}" => each }
  source                   = "../.."
  private_dns_zone_name    = each.value.zone_name
  resource_group_name      = each.value.resource_group_name
  private_dns_record_type  = each.value.record_type
  private_dns_record_ttl   = each.value.ttl
  private_dns_record_name  = each.value.record_name
  private_dns_record_value = each.value.record_value
  tags                     = var.tags
  depends_on               = [azurerm_private_dns_zone.private_dns]
}

# Administer TXT records example
module "dns-txt-records-administration-test" {
  for_each                 = { for each in var.dns_txt_records : "${each.record_type}-${each.record_no}" => each }
  source                   = "../.."
  private_dns_zone_name    = each.value.zone_name
  resource_group_name      = each.value.resource_group_name
  private_dns_record_type  = each.value.record_type
  private_dns_record_ttl   = each.value.ttl
  private_dns_record_name  = each.value.record_name
  private_dns_record_value = each.value.record_value
  tags                     = var.tags
  depends_on               = [azurerm_private_dns_zone.private_dns]
}
