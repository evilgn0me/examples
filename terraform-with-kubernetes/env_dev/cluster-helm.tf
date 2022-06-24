provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks.name]
      command     = "aws"
    }
  }
}

resource "helm_release" "nginx-ingress" {
  name       = "main"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = kubernetes_namespace.tools.metadata.0.name
  version    = "4.0.6"

  values = [
    "${file("resources/nginx-ingress.yaml")}"
  ]

}

resource "helm_release" "metrics-server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = kubernetes_namespace.tools.metadata.0.name
  version    = "3.6.0"
}

resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "1.6.1"
  namespace  = kubernetes_namespace.tools.metadata.0.name

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "pong-service" {
  name       = "main"
  chart      = "./resources/pong-service"

  set {
    name  = "image.repository"
    value = data.terraform_remote_state.essentials.outputs.ecr_repository
  }
}