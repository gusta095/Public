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
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw-vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat-gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.rt-private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.rt-public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.subteste-private-1-a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.subteste-public-1-a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.subteste-private-1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subteste-public-1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc-teste](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az-subpri"></a> [az-subpri](#input\_az-subpri) | zona da subnet privada | `string` | `"us-east-1a"` | no |
| <a name="input_az-subpub"></a> [az-subpub](#input\_az-subpub) | zona da subnet publica | `string` | `"us-east-1a"` | no |
| <a name="input_cidr-subpri"></a> [cidr-subpri](#input\_cidr-subpri) | Range de IP da VPC | `string` | `"10.0.2.0/24"` | no |
| <a name="input_cidr-subpub"></a> [cidr-subpub](#input\_cidr-subpub) | Range de IP da VPC | `string` | `"10.0.1.0/24"` | no |
| <a name="input_cidr-vpc"></a> [cidr-vpc](#input\_cidr-vpc) | Range de IP da VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_igw-name"></a> [igw-name](#input\_igw-name) | nome do internet gateway | `string` | `"igw-vpc"` | no |
| <a name="input_public-ip-off"></a> [public-ip-off](#input\_public-ip-off) | atachar ip publico automaticamente | `string` | `"false"` | no |
| <a name="input_public-ip-on"></a> [public-ip-on](#input\_public-ip-on) | atachar ip publico automaticamente | `string` | `"true"` | no |
| <a name="input_subnet-name-pri"></a> [subnet-name-pri](#input\_subnet-name-pri) | Nome da subnet privada | `string` | `"subteste-private-1"` | no |
| <a name="input_subnet-name-pub"></a> [subnet-name-pub](#input\_subnet-name-pub) | Nome da subnet publica | `string` | `"subteste-public-1"` | no |
| <a name="input_vpc-name"></a> [vpc-name](#input\_vpc-name) | Nome da vpc | `string` | `"vpc-teste"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | n/a |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->