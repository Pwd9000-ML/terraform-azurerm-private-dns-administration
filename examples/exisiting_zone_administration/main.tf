terraform {
  #backend "azurerm" {}
  backend "local" { path = "terraform-example2.tfstate" }
}

provider "azurerm" {
  features {}
}

##########################################
# MODULE                                 #
##########################################
# Administer A records example
module "dns-a-records-administration-test" {
  for_each                 = { for each in var.dns_a_records : "${each.record_type}-${each.record_no}" => each }
  source                   = "Pwd9000-ML/private-dns-administration/azurerm"
  version                  = ">= 1.0.0"
  private_dns_zone_name    = each.value.zone_name
  resource_group_name      = each.value.resource_group_name
  private_dns_record_type  = each.value.record_type
  private_dns_record_ttl   = each.value.ttl
  private_dns_record_name  = each.value.record_name
  private_dns_record_value = each.value.record_value
  tags                     = var.tags
}

# Administer CNAME records example
module "dns-cname-records-administration-test" {
  for_each                 = { for each in var.dns_cname_records : "${each.record_type}-${each.record_no}" => each }
  source                   = "Pwd9000-ML/private-dns-administration/azurerm"
  version                  = ">= 1.0.0"
  private_dns_zone_name    = each.value.zone_name
  resource_group_name      = each.value.resource_group_name
  private_dns_record_type  = each.value.record_type
  private_dns_record_ttl   = each.value.ttl
  private_dns_record_name  = each.value.record_name
  private_dns_record_value = each.value.record_value
  tags                     = var.tags
}