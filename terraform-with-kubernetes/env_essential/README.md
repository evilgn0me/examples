## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.64.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.64.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network"></a> [network](#module\_network) | ./modules/vpcnetworkgw | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.repo](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/ecr_repository) | resource |
| [aws_iam_policy.kubernetes_read_access_policy](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/iam_policy) | resource |
| [aws_iam_user.kubedeployer](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.kubedeployer](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/iam_user_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_main_region"></a> [aws\_main\_region](#input\_aws\_main\_region) | n/a | `string` | `"us-east-2"` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Environment | `string` | `"dev"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Default project name | `string` | `"test"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository"></a> [ecr\_repository](#output\_ecr\_repository) | n/a |
| <a name="output_kubedeployer_arn"></a> [kubedeployer\_arn](#output\_kubedeployer\_arn) | arn for kubedeployer user |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_private_subnet_ids"></a> [vpc\_private\_subnet\_ids](#output\_vpc\_private\_subnet\_ids) | n/a |
