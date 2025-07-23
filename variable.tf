
variable "cluster_name" {
  description = "The kind cluster name."
  default     = "cluster"
  type        = string
}

variable "kind_cluster_config_path" {
  type        = string
  description = "The location where this cluster's kubeconfig will be saved to."
  default     = "~/.kube/config"
}

variable "kind_version" {
  description = "The kind version of kubernetes."
  default     = "v1.31.4"
  type        = string
}

variable "devtron_helm_version" {
  type        = string
  description = "The Helm version for the nginx ingress controller."
  default     = "0.22.51"
}

variable "devtron_namespace" {
  type        = string
  description = "The nginx ingress namespace (it will be created if needed)."
  default     = "devtroncd"
}
