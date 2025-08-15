
resource "helm_release" "apisix" {
  name             = "apisix"
  namespace        = "apisix"
  create_namespace = true

  repository = "https://charts.apiseven.com"
  chart      = "apisix"
  version    = "2.16.0"  # pick the version you want

  # Example configuration via values
  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "gateway.enabled"
    value = "true"
  }

  set {
    name  = "dashboard.enabled"
    value = "true"
  }

  set {
    name  = "dashboard.admin_user"
    value = "admin"
  }

  set {
    name  = "dashboard.admin_password"
    value = "SuperSecurePassword123!"
  }
}
