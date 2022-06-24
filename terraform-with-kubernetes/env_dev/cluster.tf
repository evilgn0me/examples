data "aws_region" "current" {}


data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_version = var.cluster_version
  cluster_name    = "${upper(var.env_name)}-${upper(var.project_name)}-Cluster"
  vpc_id          = data.terraform_remote_state.essentials.outputs.vpc_id
  subnets         = data.terraform_remote_state.essentials.outputs.vpc_private_subnet_ids
  write_kubeconfig = false
  node_groups = {
    default = {
      desired_capacity = 4
      max_capacity     = 4
      min_capacity     = 4

      instance_types = ["${var.instance_type}"]
      capacity_type  = var.instance_capacity_type
      k8s_labels = {
        default    = "managed_node_groups"
        GithubRepo = "terraform-aws-eks"
        GithubOrg  = "terraform-aws-modules"
      }
      update_config = {
        max_unavailable_percentage = 50
      }
    }
  }

  map_users = [
    {
      userarn  = data.terraform_remote_state.essentials.outputs.kubedeployer_arn
      username = "deployer"
      groups   = ["system:masters"]
    },
  ]
}
