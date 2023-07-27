# Automated Test 1

This terraform module test will create an **Azure Resource Group** to host two newly created **Azure Private DNS Zones**: `["pwd9000.zone1.local", "pwd9000.zone2.local"]`. The `Private DNS Zones` will then be configured with all possible options for private DNS record types: `A`, `AAAA`, `CNAME`, `MX`, `PTR`, `SRV` and `TXT` as per the variables configured in `testing.auto.tfvars`.  

Note that not all record types are required to be specified in the usage of this module.  
You only need to specify the record types you want to create/Administer.  

The `testing.auto.tfvars` file in this test is used to pass in the required variables to the module to be tested for all possible scenarios.  
