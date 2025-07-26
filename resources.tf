
data "external" "subnet" {
  program = ["/bin/bash", "-c", "docker network inspect -f '{{json .IPAM.Config}}' kind | jq .[0]"]
  depends_on = [
    kind_cluster.default
  ]
}

provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kind_cluster_config_path)
  }
}

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

module "metallb" {
  source = "./modules/metallb"
  #depends_on = [kind_cluster.default]
}

module "nginx" {
  source = "./modules/nginx"
  depends_on = [module.metallb]
}

module "argo" {
  source = "./modules/argo"
  depends_on = [module.nginx]
}

module "kyverno" {
  source = "./modules/kyverno"
  depends_on = [module.nginx]
}
