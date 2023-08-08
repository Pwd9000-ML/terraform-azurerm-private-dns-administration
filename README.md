[![Automated-Dependency-Tests-and-Release](https://github.com/Pwd9000-ML/terraform-azurerm-private-dns-administration/actions/workflows/dependency-tests.yml/badge.svg)](https://github.com/Pwd9000-ML/terraform-azurerm-private-dns-administration/actions/workflows/dependency-tests.yml) [![Dependabot](https://badgen.net/badge/Dependabot/enabled/green?icon=dependabot)](https://dependabot.com/)

# Module: Azure Private DNS Administration

## Description

Terraform Registry module for administering **AZURE Private DNS zones**.  

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-private-dns-administration/master/assets/example1.png)

See **[All Record Types](https://github.com/Pwd9000-ML/terraform-azurerm-private-dns-administration/tree/master/examples/all_record_types):**  
For an example on how to create and administer **Azure Private DNS Zones and records** in a single module for all Private DNS record types.  

See **[Existing Zone Administration](https://github.com/Pwd9000-ML/terraform-azurerm-private-dns-administration/tree/master/examples/exisiting_zone_administration):**  
For an example on how to administer **Azure Private DNS records** on existing **Private DNS Zones**.  

This module is published on the **[Public Terraform Registry - private-dns-administration](https://registry.terraform.io/modules/Pwd9000-ML/private-dns-administration/azurerm/latest)**  

Enjoy!

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.68.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.68.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_a_record.private_dns_a_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_aaaa_record.private_dns_aaaa_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_aaaa_record) | resource |
| [azurerm_private_dns_cname_record.private_dns_cname_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_cname_record) | resource |
| [azurerm_private_dns_mx_record.private_dns_mx_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_mx_record) | resource |
| [azurerm_private_dns_ptr_record.private_dns_ptr_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_ptr_record) | resource |
| [azurerm_private_dns_srv_record.private_dns_srv_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_srv_record) | resource |
| [azurerm_private_dns_txt_record.private_dns_txt_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_txt_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_dns_record_name"></a> [private\_dns\_record\_name](#input\_private\_dns\_record\_name) | value of the private dns record name | `string` | `"testrecord"` | no |
| <a name="input_private_dns_record_ttl"></a> [private\_dns\_record\_ttl](#input\_private\_dns\_record\_ttl) | value of the private dns record ttl | `number` | `300` | no |
| <a name="input_private_dns_record_type"></a> [private\_dns\_record\_type](#input\_private\_dns\_record\_type) | value of the private dns record type, only allowed options are: 'A', 'AAAA', 'CNAME', 'MX', 'PTR', 'SRV', 'TXT' | `string` | `"A"` | no |
| <a name="input_private_dns_record_value"></a> [private\_dns\_record\_value](#input\_private\_dns\_record\_value) | value of the private dns record/s block. Usage of any is due to the fact that each record type has a different structure which can be string:[CNAME], set:[A, AAAA, PTR] or object:[MX, SRV, TXT] | `any` | n/a | yes |
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | value of the private dns zone name | `string` | `"myorg.zone.local"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | value of the resource group name | `string` | `"rg-where-zone-is-located"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | value of the tags | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->