# Existing Zone Administration Example

This example will create private DNS record types: `A` and `CNAME` on an existing **Azure Private DNS Zone**: `["example.zone.local"]` as per the variables configured in `common.auto.tfvars`.  

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-private-dns-administration/master/assets/example2.png)

Note that not all record types are required to be specified in the usage of this module, this example only shows record types: `A` and `CNAME`.  
You only need to specify the record types you want to create/Administer.  
The `common.auto.tfvars` file in this test is used to pass in the required variables to the module to be tested for all possible record types.  

See the example: **[All Record Types](https://github.com/Pwd9000-ML/terraform-azurerm-private-dns-administration/tree/master/examples/all_record_types)**, for an example on how to administer all record types.  

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns-a-records-administration-test"></a> [dns-a-records-administration-test](#module\_dns-a-records-administration-test) | Pwd9000-ML/private-dns-administration/azurerm | >= 1.0.0 |
| <a name="module_dns-cname-records-administration-test"></a> [dns-cname-records-administration-test](#module\_dns-cname-records-administration-test) | Pwd9000-ML/private-dns-administration/azurerm | >= 1.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_a_records"></a> [dns\_a\_records](#input\_dns\_a\_records) | Specifies values of A records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br/>    zone_name           = string<br/>    resource_group_name = string<br/>    record_no           = number<br/>    record_type         = string<br/>    record_name         = string<br/>    ttl                 = number<br/>    record_value        = list(string)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "record_name": "testA1",<br/>    "record_no": 1,<br/>    "record_type": "A",<br/>    "record_value": [<br/>      "10.0.1.10"<br/>    ],<br/>    "resource_group_name": "rg-where-zone-is-located",<br/>    "ttl": 300,<br/>    "zone_name": "myorg.zone.local"<br/>  }<br/>]</pre> | no |
| <a name="input_dns_aaaa_records"></a> [dns\_aaaa\_records](#input\_dns\_aaaa\_records) | Specifies values of AAAA records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br/>    zone_name           = string<br/>    resource_group_name = string<br/>    record_no           = number<br/>    record_type         = string<br/>    record_name         = string<br/>    ttl                 = number<br/>    record_value        = list(string)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "record_name": "testAAAA1",<br/>    "record_no": 1,<br/>    "record_type": "AAAA",<br/>    "record_value": [<br/>      "fd5d:70bc:930e:d008:0000:0000:0000:7334"<br/>    ],<br/>    "resource_group_name": "rg-where-zone-is-located",<br/>    "ttl": 300,<br/>    "zone_name": "myorg.zone.local"<br/>  }<br/>]</pre> | no |
| <a name="input_dns_cname_records"></a> [dns\_cname\_records](#input\_dns\_cname\_records) | Specifies values of CNAME records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br/>    zone_name           = string<br/>    resource_group_name = string<br/>    record_no           = number<br/>    record_type         = string<br/>    record_name         = string<br/>    ttl                 = number<br/>    record_value        = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "record_name": "msservice1",<br/>    "record_no": 1,<br/>    "record_type": "CNAME",<br/>    "record_value": "contoso.com",<br/>    "resource_group_name": "rg-where-zone-is-located",<br/>    "ttl": 300,<br/>    "zone_name": "myorg.zone.local"<br/>  }<br/>]</pre> | no |
| <a name="input_dns_mx_records"></a> [dns\_mx\_records](#input\_dns\_mx\_records) | Specifies values of MX records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br/>    zone_name           = string<br/>    resource_group_name = string<br/>    record_no           = number<br/>    record_type         = string<br/>    record_name         = string<br/>    ttl                 = number<br/>    record_value = list(object({<br/>      preference = number<br/>      exchange   = string<br/>    }))<br/>  }))</pre> | <pre>[<br/>  {<br/>    "record_name": "exchange1",<br/>    "record_no": 1,<br/>    "record_type": "MX",<br/>    "record_value": [<br/>      {<br/>        "exchange": "mx1.contoso.com",<br/>        "preference": 10<br/>      },<br/>      {<br/>        "exchange": "backupmx.contoso.com",<br/>        "preference": 20<br/>      }<br/>    ],<br/>    "resource_group_name": "rg-where-zone-is-located",<br/>    "ttl": 300,<br/>    "zone_name": "myorg.zone.local"<br/>  }<br/>]</pre> | no |
| <a name="input_dns_ptr_records"></a> [dns\_ptr\_records](#input\_dns\_ptr\_records) | Specifies values of PTR records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br/>    zone_name           = string<br/>    resource_group_name = string<br/>    record_no           = number<br/>    record_type         = string<br/>    record_name         = string<br/>    ttl                 = number<br/>    record_value        = list(string)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "record_name": "15",<br/>    "record_no": 1,<br/>    "record_type": "PTR",<br/>    "record_value": [<br/>      "test.example.com"<br/>    ],<br/>    "resource_group_name": "rg-where-zone-is-located",<br/>    "ttl": 300,<br/>    "zone_name": "myorg.zone.local"<br/>  }<br/>]</pre> | no |
| <a name="input_dns_srv_records"></a> [dns\_srv\_records](#input\_dns\_srv\_records) | Specifies values of SRV records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br/>    zone_name           = string<br/>    resource_group_name = string<br/>    record_no           = number<br/>    record_type         = string<br/>    record_name         = string<br/>    ttl                 = number<br/>    record_value = list(object({<br/>      priority = number<br/>      weight   = number<br/>      port     = number<br/>      target   = string<br/>    }))<br/>  }))</pre> | <pre>[<br/>  {<br/>    "record_name": "testSRV",<br/>    "record_no": 1,<br/>    "record_type": "SRV",<br/>    "record_value": [<br/>      {<br/>        "port": 8080,<br/>        "priority": 1,<br/>        "target": "target1.contoso.com",<br/>        "weight": 5<br/>      },<br/>      {<br/>        "port": 8080,<br/>        "priority": 10,<br/>        "target": "target2.contoso.com",<br/>        "weight": 10<br/>      }<br/>    ],<br/>    "resource_group_name": "rg-where-zone-is-located",<br/>    "ttl": 300,<br/>    "zone_name": "myorg.zone.local"<br/>  }<br/>]</pre> | no |
| <a name="input_dns_txt_records"></a> [dns\_txt\_records](#input\_dns\_txt\_records) | Specifies values of TXT records to create across multiple zones, each 'record\_no' has to be unique. | <pre>list(object({<br/>    zone_name           = string<br/>    resource_group_name = string<br/>    record_no           = number<br/>    record_type         = string<br/>    record_name         = string<br/>    ttl                 = number<br/>    record_value = object({<br/>      value = string<br/>    })<br/>  }))</pre> | <pre>[<br/>  {<br/>    "record_name": "testTXT1",<br/>    "record_no": 1,<br/>    "record_type": "TXT",<br/>    "record_value": {<br/>      "value": "v=spf1 mx ~all"<br/>    },<br/>    "resource_group_name": "rg-where-zone-is-located",<br/>    "ttl": 300,<br/>    "zone_name": "myorg.zone.local"<br/>  }<br/>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | value of the tags | `map(string)` | <pre>{<br/>  "Author": "Marcel Lupo",<br/>  "Description": "Automated test for DNS administration module.",<br/>  "GitHub": "https://registry.terraform.io/modules/Pwd9000-ML/private-dns-administration/azurerm/latest",<br/>  "Terraform": "True"<br/>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->