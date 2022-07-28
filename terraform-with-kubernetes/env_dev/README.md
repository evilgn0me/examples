## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.64.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.64.2 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 17.24.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.ecr_access](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/iam_policy) | resource |
| [aws_iam_policy.s3_access_policy](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/iam_policy) | resource |
| [aws_iam_role.iam_for_lambda](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecr_access](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.s3_to_lambda_access](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.test_lambda](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/lambda_function) | resource |
| [aws_s3_bucket.test](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/resources/s3_bucket) | resource |
| [helm_release.cert-manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics-server](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.nginx-ingress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.pong-service](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.app_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.tools](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [aws_eks_cluster.eks](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.eks](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/data-sources/eks_cluster_auth) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/3.64.2/docs/data-sources/region) | data source |
| [terraform_remote_state.essentials](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_main_region"></a> [aws\_main\_region](#input\_aws\_main\_region) | n/a | `string` | `"us-east-2"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | EKS Cluster version | `string` | `"1.22"` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Environment | `string` | `"dev"` | no |
| <a name="input_instance_capacity_type"></a> [instance\_capacity\_type](#input\_instance\_capacity\_type) | Capacity type for cluster nodes. | `string` | `"SPOT"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type | `string` | `"c5.xlarge"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Default project name | `string` | `"test"` | no |

## Outputs

No outputs.
