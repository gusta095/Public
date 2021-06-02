<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.gusta-ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | n/a | `string` | `"ami-09e67e426f25ce0d7"` | no |
| <a name="input_instance_number"></a> [instance\_number](#input\_instance\_number) | n/a | `string` | `"1"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `"gusta-keypair-teste"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | n/a | `string` | `"sg-00000000000"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | `"subnet-7424135a"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `string` | `"gusta-ec2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Availability_zone"></a> [Availability\_zone](#output\_Availability\_zone) | n/a |
| <a name="output_Instance-arn"></a> [Instance-arn](#output\_Instance-arn) | n/a |
| <a name="output_Instance-id"></a> [Instance-id](#output\_Instance-id) | n/a |
| <a name="output_Key_name"></a> [Key\_name](#output\_Key\_name) | n/a |
| <a name="output_Private-IP"></a> [Private-IP](#output\_Private-IP) | n/a |
| <a name="output_Public-IP"></a> [Public-IP](#output\_Public-IP) | n/a |
| <a name="output_Public_dns"></a> [Public\_dns](#output\_Public\_dns) | n/a |
| <a name="output_Security-group"></a> [Security-group](#output\_Security-group) | n/a |
| <a name="output_Subnet-id"></a> [Subnet-id](#output\_Subnet-id) | n/a |
| <a name="output_Volume_tags"></a> [Volume\_tags](#output\_Volume\_tags) | n/a |
| <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns) | n/a |
<!-- END_TF_DOCS -->