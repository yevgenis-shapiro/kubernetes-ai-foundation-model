
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

module "nginx" {
  source = "./modules/nginx"
  depends_on = [kind_cluster.default]
}

module "metallb" {
  source = "./modules/metallb"
  depends_on = [module.nginx]
}

module "argo" {
  source = "./modules/argo"
  depends_on = [module.nginx]
}

module "kyverno" {
  source = "./modules/kyverno"
  depends_on = [module.argo]
}
