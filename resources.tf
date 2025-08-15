
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

module "metallb" {
  source = "./modules/metallb"
  depends_on = [kind_cluster.default]
  kind_cluster_config_path = var.kind_cluster_config_path
}
module "nginx" {
  source = "./modules/nginx"
  depends_on = [module.metallb]
}
module "api" {
  source = "./modules/api"
  depends_on = [module.nginx]
}
module "argo" {
  source = "./modules/argo"
  depends_on = [module.api]
}
module "llm" {
  source = "./modules/llm"
  depends_on = [module.api]
}



