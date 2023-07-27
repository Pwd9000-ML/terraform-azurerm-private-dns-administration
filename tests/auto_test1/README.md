# Automated Test 1

This terraform module test will create an **Azure Resource Group** to host two newly created **Azure Private DNS Zones**: `["pwd9000.zone1.local", "pwd9000.zone2.local"]`. The `Private DNS Zones` will then be configured with all possible options for private DNS record types: `A`, `AAAA`, `CNAME`, `MX`, `PTR`, `SRV` and `TXT` as per the variables configured in `testing.auto.tfvars`.  

Note that not all record types are required to be specified in the usage of this module.  
You only need to specify the record types you want to create/Administer.  

The `testing.auto.tfvars` file in this test is used to pass in the required variables to the module to be tested for all possible scenarios.  

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns-a-records-administration-test"></a> [dns-a-records-administration-test](#module\_dns-a-records-administration-test) | ../.. | n/a |
| <a name="module_dns-aaaa-records-administration-test"></a> [dns-aaaa-records-administration-test](#module\_dns-aaaa-records-administration-test) | ../.. | n/a |
| <a name="module_dns-cname-records-administration-test"></a> [dns-cname-records-administration-test](#module\_dns-cname-records-administration-test) | ../.. | n/a |
| <a name="module_dns-mx-records-administration-test"></a> [dns-mx-records-administration-test](#module\_dns-mx-records-administration-test) | ../.. | n/a |
| <a name="module_dns-ptr-records-administration-test"></a> [dns-ptr-records-administration-test](#module\_dns-ptr-records-administration-test) | ../.. | n/a |
| <a name="module_dns-srv-records-administration-test"></a> [dns-srv-records-administration-test](#module\_dns-srv-records-administration-test) | ../.. | n/a |
| <a name="module_dns-txt-records-administration-test"></a> [dns-txt-records-administration-test](#module\_dns-txt-records-administration-test) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_zone.private_dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_a_records"></a> [dns\_a\_records](#input\_dns\_a\_records) | Specifies values of A records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br>    zone_name           = string<br>    resource_group_name = string<br>    record_no           = number<br>    record_type         = string<br>    record_name         = string<br>    ttl                 = number<br>    record_value        = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "record_name": "testA1",<br>    "record_no": 1,<br>    "record_type": "A",<br>    "record_value": [<br>      "10.0.1.10"<br>    ],<br>    "resource_group_name": "rg-where-zone-is-located",<br>    "ttl": 300,<br>    "zone_name": "myorg.zone.local"<br>  }<br>]</pre> | no |
| <a name="input_dns_aaaa_records"></a> [dns\_aaaa\_records](#input\_dns\_aaaa\_records) | Specifies values of AAAA records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br>    zone_name           = string<br>    resource_group_name = string<br>    record_no           = number<br>    record_type         = string<br>    record_name         = string<br>    ttl                 = number<br>    record_value        = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "record_name": "testAAAA1",<br>    "record_no": 1,<br>    "record_type": "AAAA",<br>    "record_value": [<br>      "fd5d:70bc:930e:d008:0000:0000:0000:7334"<br>    ],<br>    "resource_group_name": "rg-where-zone-is-located",<br>    "ttl": 300,<br>    "zone_name": "myorg.zone.local"<br>  }<br>]</pre> | no |
| <a name="input_dns_cname_records"></a> [dns\_cname\_records](#input\_dns\_cname\_records) | Specifies values of CNAME records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br>    zone_name           = string<br>    resource_group_name = string<br>    record_no           = number<br>    record_type         = string<br>    record_name         = string<br>    ttl                 = number<br>    record_value        = string<br>  }))</pre> | <pre>[<br>  {<br>    "record_name": "msservice1",<br>    "record_no": 1,<br>    "record_type": "CNAME",<br>    "record_value": "contoso.com",<br>    "resource_group_name": "rg-where-zone-is-located",<br>    "ttl": 300,<br>    "zone_name": "myorg.zone.local"<br>  }<br>]</pre> | no |
| <a name="input_dns_mx_records"></a> [dns\_mx\_records](#input\_dns\_mx\_records) | Specifies values of MX records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br>    zone_name           = string<br>    resource_group_name = string<br>    record_no           = number<br>    record_type         = string<br>    record_name         = string<br>    ttl                 = number<br>    record_value = list(object({<br>      preference = number<br>      exchange   = string<br>    }))<br>  }))</pre> | <pre>[<br>  {<br>    "record_name": "exchange1",<br>    "record_no": 1,<br>    "record_type": "MX",<br>    "record_value": [<br>      {<br>        "exchange": "mx1.contoso.com",<br>        "preference": 10<br>      },<br>      {<br>        "exchange": "backupmx.contoso.com",<br>        "preference": 20<br>      }<br>    ],<br>    "resource_group_name": "rg-where-zone-is-located",<br>    "ttl": 300,<br>    "zone_name": "myorg.zone.local"<br>  }<br>]</pre> | no |
| <a name="input_dns_ptr_records"></a> [dns\_ptr\_records](#input\_dns\_ptr\_records) | Specifies values of PTR records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br>    zone_name           = string<br>    resource_group_name = string<br>    record_no           = number<br>    record_type         = string<br>    record_name         = string<br>    ttl                 = number<br>    record_value        = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "record_name": "15",<br>    "record_no": 1,<br>    "record_type": "PTR",<br>    "record_value": [<br>      "test.example.com"<br>    ],<br>    "resource_group_name": "rg-where-zone-is-located",<br>    "ttl": 300,<br>    "zone_name": "myorg.zone.local"<br>  }<br>]</pre> | no |
| <a name="input_dns_srv_records"></a> [dns\_srv\_records](#input\_dns\_srv\_records) | Specifies values of SRV records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br>    zone_name           = string<br>    resource_group_name = string<br>    record_no           = number<br>    record_type         = string<br>    record_name         = string<br>    ttl                 = number<br>    record_value = list(object({<br>      priority = number<br>      weight   = number<br>      port     = number<br>      target   = string<br>    }))<br>  }))</pre> | <pre>[<br>  {<br>    "record_name": "testSRV",<br>    "record_no": 1,<br>    "record_type": "SRV",<br>    "record_value": [<br>      {<br>        "port": 8080,<br>        "priority": 1,<br>        "target": "target1.contoso.com",<br>        "weight": 5<br>      },<br>      {<br>        "port": 8080,<br>        "priority": 10,<br>        "target": "target2.contoso.com",<br>        "weight": 10<br>      }<br>    ],<br>    "resource_group_name": "rg-where-zone-is-located",<br>    "ttl": 300,<br>    "zone_name": "myorg.zone.local"<br>  }<br>]</pre> | no |
| <a name="input_dns_txt_records"></a> [dns\_txt\_records](#input\_dns\_txt\_records) | Specifies values of TXT records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br>    zone_name           = string<br>    resource_group_name = string<br>    record_no           = number<br>    record_type         = string<br>    record_name         = string<br>    ttl                 = number<br>    record_value = object({<br>      value = string<br>    })<br>  }))</pre> | <pre>[<br>  {<br>    "record_name": "testTXT1",<br>    "record_no": 1,<br>    "record_type": "TXT",<br>    "record_value": {<br>      "value": "v=spf1 mx ~all"<br>    },<br>    "resource_group_name": "rg-where-zone-is-located",<br>    "ttl": 300,<br>    "zone_name": "myorg.zone.local"<br>  }<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | value of the location where the resources are located. | `string` | `"uksouth"` | no |
| <a name="input_private_dns_zones"></a> [private\_dns\_zones](#input\_private\_dns\_zones) | value of the private dns zones to create. | `list(string)` | <pre>[<br>  "myorg.zone1.local",<br>  "myorg.zone2.local"<br>]</pre> | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | value of the resource group name here private DNS zones are hosted. | `string` | `"rg-where-zone-is-located"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | value of the tags | `map(string)` | <pre>{<br>  "Author": "Marcel Lupo",<br>  "Description": "Automated test for DNS administration module.",<br>  "GitHub": "https://registry.terraform.io/modules/Pwd9000-ML/private-dns-administration/azurerm/latest",<br>  "Terraform": "True"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->