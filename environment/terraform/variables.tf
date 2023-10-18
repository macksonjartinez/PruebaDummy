variable "resource_group_name" {
  type        = string
  description = "Nombre del resource group en azure"
}
variable "location" {
  type        = string
  description = "Ubicacion de los recursos en azure"
}
variable "cluster_name" {
  type        = string
  description = "Nombre del cluster"
}
variable "kubernetes_version" {
  type        = string
  description = "Version de kubernetes"
}
variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}
variable "acr_name" {
  type        = string
  description = "ACR name"
}