terraform {
  backend "gcs" {
    bucket  = "gke-project-365821-tf-state"
    prefix  = "terraform/state"
  }
}