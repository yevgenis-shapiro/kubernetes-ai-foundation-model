provider "kubernetes" {
  config_path = "~/.kube/config"
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
  version          = "0.14.8"
  namespace        = kubernetes_namespace.metallb.metadata[0].name
  create_namespace = false
  skip_crds        = false

  depends_on = [kubernetes_namespace.metallb]
}

resource "null_resource" "metallb_config" {
  depends_on = [helm_release.metallb]

  provisioner "local-exec" {
    command = <<EOT
kubectl apply -f - <<EOF
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: default
  namespace: metallb-system
spec:
  addresses:
  - 172.18.255.100-172.18.255.120
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: default
  namespace: metallb-system
spec:
  ipAddressPools:
  - default
EOF
EOT
  }
}
