variable "project_id" {
  default = "windy-gearbox-451911-s2"
}

variable "region" {
  default = "us-central1"  # הגדרת אזור
}

variable "cluster_name" {
  default = "devops-cluster"
}

variable "network_name" {
  default     = "default"  # אם ברצונך להשתמש ברשת ברירת מחדל, תוכל להגדיר זאת
}

variable "subnetwork_name" {
  default     = "default"  # אם ברצונך להשתמש ב-subnetwork ברירת מחדל
}

variable "gcp_credentials_json" {
  description = "The Google Cloud credentials in JSON format"
  type        = string
}
