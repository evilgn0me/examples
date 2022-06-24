output "kubedeployer_arn" {
  value = aws_iam_user.kubedeployer.arn
  description = "arn for kubedeployer user"
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "vpc_private_subnet_ids" {
  value = module.network.vpc_private_subnet_ids
}

output "ecr_repository" {
  value = aws_ecr_repository.repo.repository_url
}