variable "domain_name" {
  description = "The domain name to be used for the certificate"
  type        = string
}

variable "r53_zone_id" {
  description = "Parent zone_id the certificate should be created for"
  type        = string
}

variable "subject_alternative_names" {
  description = "List of SANs to include on the certificate, changing this after create forces a re-create"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Map of tags to provide to created resources"
  type        = map(string)
  default     = {}
}

variable "ttl" {
  description = "TTL to use for R53 verification records, defaults to a short time to allow quick re-create if needed"
  type        = number
  default     = 60
}

variable "create_validation_records" {
  description = "Should this module auto-create the needed ACM validation records?"
  type        = bool
  default     = true
}
