# Automated Test 1

This terraform module test will create an **Azure Resource Group** to create and host a few **Azure Private DNS Zones**.  
The `Private DNS Zones` will then be configured with `A`, `AAAA`, `CNAME`, `MX`, `PTR`, `SRV` and `TXT` records as per the variable `var.dns_config`.
