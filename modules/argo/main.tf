
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  version    = "8.2.5"               # <-- Latest Helm chart version
  create_namespace = true
  timeout    = 300
  values = [
    file("./argo-values.yaml")
  ]
}

