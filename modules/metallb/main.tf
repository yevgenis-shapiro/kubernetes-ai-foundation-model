
resource "helm_release" "metallb" {
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  namespace        = "metallb-system"
  version          = "0.14.8"
  create_namespace = true
  timeout          = 300

  values = [
    <<EOT
configInline:
  address-pools:
    - name: default
      protocol: layer2
      addresses:
        - 172.18.255.100-172.18.255.120
EOT
  ]
}

