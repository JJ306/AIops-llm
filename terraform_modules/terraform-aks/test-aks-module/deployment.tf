# provider "null" {}

# # Define variables
# variable "github_repo_url" {
#   description = "URL of the GitHub repository containing Kubernetes manifests"
# }

# variable "deployment_yaml_path" {
#   description = "Path to the deployment.yaml file in the GitHub repository"
# }

# variable "service_yaml_path" {
#   description = "Path to the service.yaml file in the GitHub repository"
# }

# variable "docker_image" {
#   description = "Docker image to deploy"
# }

# # Fetch Kubernetes manifests from GitHub repository
# data "http" "deployment_yaml" {
#   url = "${var.github_repo_url}/${var.deployment_yaml_path}"
# }

# data "http" "service_yaml" {
#   url = "${var.github_repo_url}/${var.service_yaml_path}"
# }

# # Deploy Kubernetes manifests to AKS cluster
# resource "null_resource" "deploy_manifests" {
#   depends_on = [azurerm_kubernetes_cluster.aks_cluster]

#   provisioner "local-exec" {
#     command = <<-EOT
#       kubectl apply -f ${data.http.deployment_yaml.body}
#       kubectl apply -f ${data.http.service_yaml.body}
#     EOT
#   }
# }

# # Configure AKS to pull images from Docker Hub
# resource "kubernetes_secret" "dockerhub_secret" {
#   metadata {
#     name = "dockerhub-secret"
#   }

#   data = {
#     ".dockerconfigjson" = base64encode(jsonencode({
#       "auths": {
#         "https://index.docker.io/v1/": {
#           "auth": base64encode("YOUR_DOCKER_HUB_USERNAME:YOUR_DOCKER_HUB_PASSWORD")
#         }
#       }
#     }))
#   }

#   depends_on = [null_resource.deploy_manifests]
# }

# resource "kubernetes_service_account" "default" {
#   metadata {
#     name = "default"
#   }

#   depends_on = [kubernetes_secret.dockerhub_secret]
# }

# resource "kubernetes_pod" "app_pod" {
#   metadata {
#     name = "app-pod"
#   }

#   spec {
#     container {
#       image = var.docker_image
#       name  = "app-container"

#       image_pull_secret {
#         name = kubernetes_secret.dockerhub_secret.metadata.0.name
#       }
#     }
#   }

#   depends_on = [kubernetes_service_account.default]
# }
