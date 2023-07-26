##################################################
# VARIABLES                                      #
##################################################
variable "private_dns_record_type" {
  type        = string
  description = "value of the private dns record type, only allowed options are: 'A', 'AAAA', 'CNAME', 'MX', 'PTR', 'SRV', 'TXT'"
  default     = "A"
  validation {
    condition     = can(regex("^(A|AAAA|CNAME|MX|PTR|SRV|TXT)$", var.private_dns_record_type))
    error_message = "Invalid value for private_dns_record_type, only allowed options are: 'A', 'AAAA', 'CNAME', 'MX', 'PTR', 'SRV', 'TXT'"
  }
}

variable "private_dns_record_name" {
  type        = string
  description = "value of the private dns record name"
}

variable "resource_group_name" {
  type        = string
  description = "value of the resource group name"
}

variable "private_dns_record_ttl" {
  type        = number
  description = "value of the private dns record ttl"
  default     = 300
}

variable "private_dns_zone_name" {
  type        = string
  description = "value of the private dns zone name"
}

variable "private_dns_record_value" {
  type        = list(any)
  description = "value of the private dns record/s block. Usage of any is due to the fact that each record type has a different structure which can be string:[CNAME], set:[A, AAAA, PTR] or object:[MX, SRV, TXT]"
}

variable "tags" {
  type        = map(string)
  description = "value of the tags"
  default     = {}
}