variable "project_id" {
  default = "windy-gearbox-451911-s2"
}

variable "region" {
  default = "us-east1"  # זה האזור שבו הפרויקט שלך נמצא
}

variable "cluster_name" {
  default = "devops-cluster"
}

variable "gcp_credentials_json" {
  type        = string
  description = "GCP credentials in JSON format"
}
