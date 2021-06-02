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
| [aws_sns_topic.gusta-topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.gusta-topic-subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subscription-endpoint"></a> [subscription-endpoint](#input\_subscription-endpoint) | n/a | `string` | `"arn:aws:sqs:us-east-1:936943748055:gusta-teste"` | no |
| <a name="input_subscription-protocol"></a> [subscription-protocol](#input\_subscription-protocol) | n/a | `string` | `"sqs"` | no |
| <a name="input_topic-name"></a> [topic-name](#input\_topic-name) | n/a | `string` | `"gusta-topic"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_topic-arn"></a> [topic-arn](#output\_topic-arn) | n/a |
<!-- END_TF_DOCS -->