variable "resource_group_name" {
  type        = string
  description = "value of the resource group name here private DNS zones are hosted."
  default     = "rg-where-zone-is-located"
}

variable "location" {
  type        = string
  description = "value of the location where the resources are located."
  default     = "uksouth"
}

variable "private_dns_zones" {
  type        = list(string)
  description = "value of the private dns zones to create."
  default     = ["myorg.zone1.local", "myorg.zone2.local"]
}

variable "tags" {
  type        = map(string)
  description = "value of the tags"
  default = {
    Terraform   = "True"
    Description = "Automated test for DNS administration module."
    Author      = "Marcel Lupo"
    GitHub      = "https://registry.terraform.io/modules/Pwd9000-ML/private-dns-administration/azurerm/latest"
  }
}

### DNS configuration variables (Not all of these are needed, only the ones you want to use)
# A records example var #
variable "dns_a_records" {
  type = list(object({
    zone_name           = string
    resource_group_name = string
    record_no           = number
    record_type         = string
    record_name         = string
    ttl                 = number
    record_value        = list(string)
  }))
  default = [{
    record_no           = 1
    zone_name           = "myorg.zone.local"
    resource_group_name = "rg-where-zone-is-located"
    record_type         = "A"
    record_name         = "testA1"
    ttl                 = 300
    record_value        = ["10.0.1.10"]
  }]
  description = "Specifies values of A records to create across multiple zones, each 'record_no' has to be unique."
}

# AAAA records example var #
variable "dns_aaaa_records" {
  type = list(object({
    zone_name           = string
    resource_group_name = string
    record_no           = number
    record_type         = string
    record_name         = string
    ttl                 = number
    record_value        = list(string)
  }))
  default = [{
    record_no           = 1
    zone_name           = "myorg.zone.local"
    resource_group_name = "rg-where-zone-is-located"
    record_type         = "AAAA"
    record_name         = "testAAAA1"
    ttl                 = 300
    record_value        = ["fd5d:70bc:930e:d008:0000:0000:0000:7334"]
  }]
  description = "Specifies values of AAAA records to create across multiple zones, each 'record_no' has to be unique."
}

# PTR records example var #
variable "dns_ptr_records" {
  type = list(object({
    zone_name           = string
    resource_group_name = string
    record_no           = number
    record_type         = string
    record_name         = string
    ttl                 = number
    record_value        = list(string)
  }))
  default = [{
    record_no           = 1
    zone_name           = "myorg.zone.local"
    resource_group_name = "rg-where-zone-is-located"
    record_type         = "PTR"
    record_name         = "15"
    ttl                 = 300
    record_value        = ["test.example.com"]
  }]
  description = "Specifies values of PTR records to create across multiple zones, each 'record_no' has to be unique."
}

# CNAME records example var #
variable "dns_cname_records" {
  type = list(object({
    zone_name           = string
    resource_group_name = string
    record_no           = number
    record_type         = string
    record_name         = string
    ttl                 = number
    record_value        = string
  }))
  default = [{
    record_no           = 1
    zone_name           = "myorg.zone.local"
    resource_group_name = "rg-where-zone-is-located"
    record_type         = "CNAME"
    record_name         = "msservice1"
    ttl                 = 300
    record_value        = "contoso.com"
  }]
  description = "Specifies values of CNAME records to create across multiple zones, each 'record_no' has to be unique."
}

# MX records example var #
variable "dns_mx_records" {
  type = list(object({
    zone_name           = string
    resource_group_name = string
    record_no           = number
    record_type         = string
    record_name         = string
    ttl                 = number
    record_value = list(object({
      preference = number
      exchange   = string
    }))
  }))
  default = [{
    record_no           = 1
    zone_name           = "myorg.zone.local"
    resource_group_name = "rg-where-zone-is-located"
    record_type         = "MX"
    record_name         = "exchange1"
    ttl                 = 300
    record_value = [
      { preference = 10, exchange = "mx1.contoso.com" },
      { preference = 20, exchange = "backupmx.contoso.com" }
    ]
  }]
  description = "Specifies values of MX records to create across multiple zones, each 'record_no' has to be unique."
}

# SRV records example var #
variable "dns_srv_records" {
  type = list(object({
    zone_name           = string
    resource_group_name = string
    record_no           = number
    record_type         = string
    record_name         = string
    ttl                 = number
    record_value = list(object({
      priority = number
      weight   = number
      port     = number
      target   = string
    }))
  }))
  default = [{
    record_no           = 1
    zone_name           = "myorg.zone.local"
    resource_group_name = "rg-where-zone-is-located"
    record_type         = "SRV"
    record_name         = "testSRV"
    ttl                 = 300
    record_value = [
      { priority = 1, weight = 5, port = 8080, target = "target1.contoso.com" },
      { priority = 10, weight = 10, port = 8080, target = "target2.contoso.com" }
    ]
  }]
  description = "Specifies values of SRV records to create across multiple zones, each 'record_no' has to be unique."
}

# TXT records example var #
variable "dns_txt_records" {
  type = list(object({
    zone_name           = string
    resource_group_name = string
    record_no           = number
    record_type         = string
    record_name         = string
    ttl                 = number
    record_value = object({
      value = string
    })
  }))
  default = [{
    record_no           = 1
    zone_name           = "myorg.zone.local"
    resource_group_name = "rg-where-zone-is-located"
    record_type         = "TXT"
    record_name         = "testTXT1"
    ttl                 = 300
    record_value        = { value = "v=spf1 mx ~all" }
  }]
  description = "Specifies values of TXT records to create across multiple zones, each 'record_no' has to be unique."
}
