resource "google_container_node_pool" "app_node_pool" {
  name           = var.node_pool_name
  location       = var.region
  cluster        = var.cluster-name
  node_count     = 1
  project = var.project_id

  autoscaling {
    max_node_count = 1
    min_node_count = 1
  }
  max_pods_per_node = 100

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    machine_type = var.machine-type
    disk_size_gb = 100

    service_account = var.service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]

    labels = {
      cluster = var.cluster-name
    }

    shielded_instance_config {
      enable_secure_boot = true
    }

    // Enable workload identity on this node pool.
    # workload_metadata_config {
    #   node_metadata = "GKE_METADATA_SERVER"
    # }

    metadata = {
      // Set metadata on the VM to supply more entropy.
      google-compute-enable-virtio-rng = "true"
      // Explicitly remove GCE legacy metadata API endpoint.
      disable-legacy-endpoints = "true"
    }
  }

  upgrade_settings {
    max_surge       = 1
    max_unavailable = 1
  }
}
