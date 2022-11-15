
variable "cluster_name" {
    description = "Cluster name"
  
}
variable "project_id" {
    description = "project ID"
  
}

variable "region" {
    description = "region of the cluster"
  
}
variable "pod_ip_range" {
    description = "IP range of the POD"
  
}

variable "services_ip_range" {
    description = "ip range of the services"
  
}

variable "vpc_network_name" {
    description = "name of the vpc"
  
}

variable "subnetwork_name" {
    description = "name of the subnet"
  
}

variable "cluster_master_range" {
    description = "master IP range of the cluster"
  
}