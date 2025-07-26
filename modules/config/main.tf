provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "metallb" {
  metadata {
    name = "metallb-system"
  }

depends_on = [
    kind_cluster.default
  ]
}
