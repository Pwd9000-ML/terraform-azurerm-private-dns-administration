locals {
  dns_config = [
    {
      "myorg.zone1.local" = [
        #A records example
        { record_no = 1, record_type = "A", record_name = "testA1", ttl = 600, record_value = ["10.0.0.1"] },
        { record_no = 2, record_type = "A", record_name = "testA2", ttl = 600, record_value = ["10.0.0.2"] },

        #AAAA records example
        { record_no = 3, record_type = "AAAA", record_name = "testAAAA1", ttl = 600, record_value = ["fd5d:70bc:930e:d008:0000:0000:0000:7334"] },
        { record_no = 4, record_type = "AAAA", record_name = "testAAAA2", ttl = 600, record_value = ["fd5d:70bc:930e:d008::7335"] },

        #CNAME records example
        { record_no = 5, record_type = "CNAME", record_name = "testCNAME1", ttl = 400, record_value = "contoso.com" },
        { record_no = 6, record_type = "CNAME", record_name = "testCNAME2", ttl = 400, record_value = "wingtip.co.uk" },

        #MX records example
        { record_no = 7, record_type = "MX", record_name = "exchange1", ttl = 300, record_value = [
          { preference = 10, exchange = "mx1.contoso.com" },
          { preference = 20, exchange = "backupmx.contoso.com" }
        ] },

        #PTR records example 
        { record_no = 8, record_type = "PTR", record_name = "15", ttl = 3600, record_value = ["test.exmple.com"] },
        { record_no = 9, record_type = "PTR", record_name = "16", ttl = 3600, record_value = ["test2.exmple.com"] },

        #SRV records example
        { record_no = 10, record_type = "SRV", record_name = "testSRV", ttl = 2400, record_value = [
          { priority = 1, weight = 5, port = 8080, target = "target1.contoso.com" },
          { priority = 10, weight = 10, port = 8080, target = "target2.contoso.com" }
        ] },

        #TXT records example
        { record_no = 11, record_type = "TXT", record_name = "testTXT1", ttl = 300, record_value = { value = "v=spf1 mx ~all" } },
        { record_no = 12, record_type = "TXT", record_name = "testTXT2", ttl = 300, record_value = { value = "v=spf2 mx ~all" } }
      ]
    }
  ]
}