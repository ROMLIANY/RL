
resource "google_container_cluster" "primary" {
  name               = "devops-cluster"
  location           = "us-east1"
  network           = "default"
  remove_default_node_pool = true
  deletion_protection = false  # שינוי כדי לאפשר מחיקה בעתיד
  initial_node_count = 1  # מינימום 1 כדי למנוע שגיאה

  lifecycle {
    ignore_changes = [node_config]
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = "us-east1"
  cluster    = google_container_cluster.primary.name
  node_count = 1  # שמירה על מינימום נדרש

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 20
    preemptible  = false
  }
}

