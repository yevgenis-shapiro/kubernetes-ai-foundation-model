
resource "helm_release" "keycloak" {
  name             = "keycloak"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "keycloak"
  namespace        = "default"
  create_namespace = true
  timeout          = 300
  #depends_on = [helm_release.mariadb-galera]

  set {
    name  = "postgresql.enabled"
    value = "true"
  }

  set {
    name  = "postgresql.auth.username"
    value = "keycloak"
  }

  set {
    name  = "postgresql.auth.password"
    value = "q1w2e3r4100@"
  }

  set {
    name  = "postgresql.auth.database"
    value = "keycloak"
  }

  set {
    name  = "postgresql.auth.existingSecret"
    value = ""
  }


