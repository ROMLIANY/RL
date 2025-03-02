provider "google" {
  project     = "windy-gearbox-451911-s2"
  region      = "us-central1"
  credentials = file("gcp-key.json")  # מכיוון שהקובץ נמצא באותה תיקיה
}
