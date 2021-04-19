output "cert_arn" {
  value = aws_acm_certificate.this.arn
}

output "cert_status" {
  value = aws_acm_certificate.this.status
}

output "domain_name" {
  value = aws_acm_certificate.this.domain_name
}