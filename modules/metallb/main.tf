provider "kubernetes" {
  config_path = "~/.kube/config" # or use config_context or in-cluster config
}

resource "kubernetes_namespace" "metallb" {
  metadata {
    name = "metallb-system"
  }
}

resource "helm_release" "metallb" {
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  namespace        = "metallb-system"
  version          = "0.14.8"
  create_namespace = true
  timeout          = 300
  skip_crds        = false
}

resource "kubernetes_manifest" "ip_pool" {
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind = "IPAddressPool"
    metadata = {
      name = "default"
      namespace = "metallb-system"
    }
    spec = {
      addresses = ["172.18.255.100-172.18.255.120"]
    }
  }
  depends_on = [helm_release.metallb]
}

resource "kubernetes_manifest" "l2_advertisement" {
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind = "L2Advertisement"
    metadata = {
      name = "advert"
      namespace = "metallb-system"
    }
    spec = {}
  }
  depends_on = [helm_release.metallb]
}
