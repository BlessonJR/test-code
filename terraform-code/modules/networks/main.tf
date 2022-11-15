resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "sub_network" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  project = var.project_id
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

