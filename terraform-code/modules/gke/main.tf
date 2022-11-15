
resource "google_container_cluster" "app_cluster" {
  name     = var.cluster_name
  location = var.region
  project = var.project_id
  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.pod_ip_range
    services_ipv4_cidr_block = var.services_ip_range
  }
  network = var.vpc_network_name
  subnetwork = var.subnetwork_name

  logging_service = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  maintenance_policy {
    daily_maintenance_window {
      start_time = "02:00"
    }
  }


  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.cluster_master_range
  }

  release_channel {
      channel = "STABLE"
  }

  addons_config {
  
    network_policy_config {
        disabled = false
      }
  }


  network_policy {
    enabled = "true"
  }

}