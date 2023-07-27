resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
private_dns_zones   = ["pwd9000.zone1.local", "pwd9000.zone2.local"]

# A records Administration example
dns_a_records = [
  {
    record_no           = 1
    zone_name           = "pwd9000.zone1.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "A"
    record_name         = "testA1"
    ttl                 = 300
    record_value        = ["10.0.1.10"]
  },
  {
    record_no           = 2
    zone_name           = "pwd9000.zone2.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "A"
    record_name         = "testA3"
    ttl                 = 300
    record_value        = ["10.0.2.10"]
  }
]

# AAAA records Administration example
dns_aaaa_records = [
  {
    record_no           = 1
    zone_name           = "pwd9000.zone1.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "AAAA"
    record_name         = "testAAAA1"
    ttl                 = 300
    record_value        = ["fd00:0:0:1::1"]
  },
  {
    record_no           = 2
    zone_name           = "pwd9000.zone2.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "AAAA"
    record_name         = "testAAAA3"
    ttl                 = 300
    record_value        = ["fd00:0:0:2::1"]
  }
]

# PTR records Administration example
dns_ptr_records = [
  {
    record_no           = 1
    zone_name           = "pwd9000.zone1.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "PTR"
    record_name         = "15"
    ttl                 = 300
    record_value        = ["test.example.com"]
  },
  {
    record_no           = 2
    zone_name           = "pwd9000.zone2.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "PTR"
    record_name         = "16"
    ttl                 = 300
    record_value        = ["test2.example.com"]
  }
]

# CNAME records Administration example
dns_cname_records = [
  {
    record_no           = 1
    zone_name           = "pwd9000.zone1.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "CNAME"
    record_name         = "msservice1"
    ttl                 = 300
    record_value        = "contoso.com"
  },
  {
    record_no           = 2
    zone_name           = "pwd9000.zone2.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "CNAME"
    record_name         = "msservice2"
    ttl                 = 300
    record_value        = "wingtiptoys.com"
  }
]

# MX records Administration example
dns_mx_records = [
  {
    record_no           = 1
    zone_name           = "pwd9000.zone1.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "MX"
    record_name         = "mail1"
    ttl                 = 300
    record_value = [
      { preference = 10, exchange = "mx1.contoso.com" },
      { preference = 20, exchange = "backupmx.contoso.com" }
    ]
  },
  {
    record_no           = 2
    zone_name           = "pwd9000.zone2.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "MX"
    record_name         = "mail2"
    ttl                 = 300
    record_value = [
      { preference = 10, exchange = "mx2.contoso.com" },
      { preference = 20, exchange = "backupmx2.contoso.com" }
    ]
  }
]

# SRV records Administration example
dns_srv_records = [
  {
    record_no           = 1
    zone_name           = "pwd9000.zone1.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "SRV"
    record_name         = "_sip._tcp"
    ttl                 = 300
    record_value = [
      {
        priority = 1
        weight   = 5
        port     = 5060
        target   = "sipserver1.contoso.com"
      },
      {
        priority = 10
        weight   = 10
        port     = 5060
        target   = "sipserver2.contoso.com"
      }
    ]
  },
  {
    record_no           = 2
    zone_name           = "pwd9000.zone2.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "SRV"
    record_name         = "_sip._tcp"
    ttl                 = 300
    record_value = [
      {
        priority = 1
        weight   = 5
        port     = 5060
        target   = "sipserver3.contoso.com"
      },
      {
        priority = 10
        weight   = 10
        port     = 5060
        target   = "sipserver4.contoso.com"
      }
    ]
  }
]

# TXT records Administration example
dns_txt_records = [
  {
    record_no           = 1
    zone_name           = "pwd9000.zone1.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "TXT"
    record_name         = "www"
    ttl                 = 300
    record_value = {
      value = "v=spf1 a mx ptr include:contoso.com ~all"
    }
  },
  {
    record_no           = 2
    zone_name           = "pwd9000.zone2.local"
    resource_group_name = "TF-Module-Automated-Tests-DNS-Admin"
    record_type         = "TXT"
    record_name         = "www"
    ttl                 = 300
    record_value = {
      value = "v=spf1 a mx ptr include:contoso.com ~all"
    }
  }
]