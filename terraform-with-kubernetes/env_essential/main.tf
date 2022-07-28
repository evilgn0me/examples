module "network" {
  source              = "./modules/vpcnetworkgw"
  vpc_cidr            = "10.1.0.0/16"
  subnet_cidr_public  = ["10.1.0.0/24", "10.1.1.0/24", "10.1.2.0/24"]
  subnet_cidr_private = ["10.1.10.0/24", "10.1.11.0/24", "10.1.12.0/24"]
  project_name        = var.project_name
  environment_name    = var.env_name
  availability_zone   = var.aws_main_region
  zone_letter         = ["a", "b", "c"]
}

resource "aws_iam_user" "kubedeployer" {
  name = "kubedeployer"
}

resource "aws_iam_policy" "kubernetes_read_access_policy" {
  name        = "KubernetesReadonly"
  path        = "/"
  description = "Kubernetes readonly policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "eks:ListNodegroups",
          "eks:DescribeFargateProfile",
          "eks:ListTagsForResource",
          "eks:ListAddons",
          "eks:DescribeAddon",
          "eks:ListFargateProfiles",
          "eks:DescribeNodegroup",
          "eks:DescribeIdentityProviderConfig",
          "eks:ListUpdates",
          "eks:DescribeUpdate",
          "eks:AccessKubernetesApi",
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:DescribeAddonVersions",
          "eks:ListIdentityProviderConfigs"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "kubedeployer" {
  user       = aws_iam_user.kubedeployer.name
  policy_arn = aws_iam_policy.kubernetes_read_access_policy.arn
}

resource "aws_ecr_repository" "repo" {
  name                 = "pong-service"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}