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

variable "dns_config" {
  type = list(object({
    zone_name           = string
    resource_group_name = string
    records = list(object({
      record_no    = number
      record_type  = string
      record_name  = string
      ttl          = number
      record_value = any #set to any because value can be string:[CNAME], set:[A, AAAA, PTR] or object:[MX, SRV, TXT]
    }))
  }))
  default = [
    {
      zone_name           = "private.dns.zone.local"
      resource_group_name = "rg-where-zone1-is-located"
      records = [
        #A records example (see tfvars file for more examples)
        { record_no = 1, record_type = "A", record_name = "testA1", ttl = 300, record_value = ["10.0.1.10"] },
        { record_no = 2, record_type = "A", record_name = "testA2", ttl = 300, record_value = ["10.0.1.11"] }
      ]
    }
  ]
  description = "specifies the dns configuration"
}