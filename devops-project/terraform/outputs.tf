output "kubernetes_cluster_id" {
  value = google_container_cluster.primary.id
}

output "kubernetes_endpoint" {
  value = google_container_cluster.primary.endpoint
}
