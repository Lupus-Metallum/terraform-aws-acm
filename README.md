# terraform-aws-acm
Used to create a DNS verified ACM certificate by R53 Zone name

<!-- BEGIN_TF_DOCS -->

<img src="https://raw.githubusercontent.com/Lupus-Metallum/brand/master/images/logo.jpg" width="400"/>



## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to be used for the certificate | `string` | n/a | yes |
| <a name="input_r53_zone_id"></a> [r53\_zone\_id](#input\_r53\_zone\_id) | Parent zone\_id the certificate should be created for | `string` | n/a | yes |
| <a name="input_create_validation_records"></a> [create\_validation\_records](#input\_create\_validation\_records) | Should this module auto-create the needed ACM validation records? | `bool` | `true` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | List of SANs to include on the certificate, changing this after create forces a re-create | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to provide to created resources | `map(string)` | `{}` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | TTL to use for R53 verification records, defaults to a short time to allow quick re-create if needed | `number` | `60` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cert_arn"></a> [cert\_arn](#output\_cert\_arn) | n/a |
| <a name="output_cert_status"></a> [cert\_status](#output\_cert\_status) | n/a |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | n/a |
| <a name="output_validation_records"></a> [validation\_records](#output\_validation\_records) | n/a |
<!-- END_TF_DOCS -->