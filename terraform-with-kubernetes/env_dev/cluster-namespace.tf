resource "kubernetes_namespace" "tools" {
  metadata {
    name = "tools"
  }
}

resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "${lower(var.project_name)}-${lower(var.env_name)}"
  }
}