resource_group_name = "TF-Module-Dns-Admin-Demo"
private_dns_zones   = ["example.zone.local"]

# A records Administration example
dns_a_records = [
  {
    record_no           = 1
    zone_name           = "example.zone.local"
    resource_group_name = "TF-Module-Dns-Admin-Demo"
    record_type         = "A"
    record_name         = "testA1"
    ttl                 = 300
    record_value        = ["10.0.1.10"]
  },
  {
    record_no           = 2
    zone_name           = "example.zone.local"
    resource_group_name = "TF-Module-Dns-Admin-Demo"
    record_type         = "A"
    record_name         = "testA2"
    ttl                 = 300
    record_value        = ["10.0.1.11"]
  },
  {
    record_no           = 3
    zone_name           = "example.zone.local"
    resource_group_name = "TF-Module-Dns-Admin-Demo"
    record_type         = "A"
    record_name         = "testA3"
    ttl                 = 300
    record_value        = ["10.0.1.12"]
  }
]

# CNAME records Administration example
dns_cname_records = [
  {
    record_no           = 1
    zone_name           = "example.zone.local"
    resource_group_name = "TF-Module-Dns-Admin-Demo"
    record_type         = "CNAME"
    record_name         = "msservice1"
    ttl                 = 300
    record_value        = "contoso.com"
  },
  {
    record_no           = 2
    zone_name           = "example.zone.local"
    resource_group_name = "TF-Module-Dns-Admin-Demo"
    record_type         = "CNAME"
    record_name         = "msservice2"
    ttl                 = 300
    record_value        = "wingtiptoys.com"
  },
  {
    record_no           = 3
    zone_name           = "example.zone.local"
    resource_group_name = "TF-Module-Dns-Admin-Demo"
    record_type         = "CNAME"
    record_name         = "msservice3"
    ttl                 = 300
    record_value        = "treyresearch.net"
  }
]
