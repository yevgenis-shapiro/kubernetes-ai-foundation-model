
resource "helm_release" "argocd" {
  name  = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "3.6.10"
  create_namespace = true
  timeout = 300

  set {
    name  = "controller.enableStatefulSet"
    value = "true"
  }


  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = "$2a$10$lgcvwdvggWeLl1AN14NWsePcWQczWHRQH2eiUNL9w/gN6NaelDl.G"
  }

}
