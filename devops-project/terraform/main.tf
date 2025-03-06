provider "google" {
  project = "windy-gearbox-451911-s2"  # עדכן את זה לשם הפרויקט שלך ב-GCP
  region  = "us-east1"  # האזור שבו אתה עובד
}

resource "google_compute_instance" "vm_instance" {
  name         = "flask-vm"
  machine_type = "e2-medium"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}  # מאפשר גישה חיצונית
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker

    # להריץ את ה-MySQL
    sudo docker run -d --name mysql_db \
      -e MYSQL_ROOT_PASSWORD=root \
      -e MYSQL_DATABASE=flask_db \
      -e MYSQL_USER=user \
      -e MYSQL_PASSWORD=password \
      -p 3306:3306 mysql:5.7

    # להריץ את Flask
    sudo docker run -d -p 5000:5000 --name flask_app \
      --link mysql_db:mysql \
      romliani/devops-project-flask:latest
  EOT
}

output "vm_external_ip" {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}
