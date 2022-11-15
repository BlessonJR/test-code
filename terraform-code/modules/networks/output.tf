output "vpc_network_name" {
    value = google_compute_network.vpc_network.name
  
}

output "subnetwork_name"{
    value = google_compute_subnetwork.sub_network.name

}
