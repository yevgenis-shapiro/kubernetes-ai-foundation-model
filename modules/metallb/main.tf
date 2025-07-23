
resource "helm_release" "metallb" {
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  namespace        = "metallb-system"
  version          = "0.14.8"
  create_namespace = true
  timeout          = 300

#  values = [
#    <<EOF
#podSecurityPolicy:
#  enabled: false
#EOF
#  ]
}

resource "local_file" "metallb_config" {
  content = templatefile("${path.module}/metallb.config.crd.tmpl", {
    metallb_ip_range = var.metallb_ip_range
  })
  filename   = "${path.module}/metallb.config.crd.yaml"
  depends_on = [helm_release.metallb]
}
