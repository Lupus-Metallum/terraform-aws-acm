data "aws_route53_zone" "parent_zone" {
  zone_id      = var.r53_zone_id
  private_zone = false
}

resource "aws_acm_certificate" "primary" {
  domain_name       = "${var.tenant_name}.${data.aws_route53_zone.parent_zone.name}"
  validation_method = "DNS"

  subject_alternative_names = ["origin.${var.tenant_name}.${data.aws_route53_zone.parent_zone.name}"]

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.tags,
    {
      Name              = "${var.tenant_name}-primary",
      SaaSResoure       = true,
      DedicatedToTenant = true,
    },
  )
}

resource "aws_route53_record" "acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.primary.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.r53_zone_id
}

resource "aws_acm_certificate_validation" "primary" {
  certificate_arn         = aws_acm_certificate.primary.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]

  timeouts {
    create = "60m"
  }
}