output "cert_arn" {
  value = aws_acm_certificate.this.arn
}

output "cert_status" {
  value = aws_acm_certificate.this.status
}

output "domain_name" {
  value = aws_acm_certificate.this.domain_name
}

output "validation_records" {
  value = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
}