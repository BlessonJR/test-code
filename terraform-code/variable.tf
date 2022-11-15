variable "project_id" {
    default = "gke-project-365821"
  
}

variable "region" {
    default = "us-central1"
  
}

variable "cluster_name" {
    default = "test-app"
  
}

variable "subnet_cidr" {
    default = "10.0.0.0/16"
  
}
variable "subnet_name" {
    default = "test-subnet"
  
}
variable "vpc_name" {
    default = "test-vpc"
  
}
variable "pod_ip_range" {
    default = "10.1.0.0/16"
  
}

variable "services_ip_range" {
    default = "10.2.0.0/16"
  
}

variable "cluster_master_range" {
    default = "10.154.0.0/28"
  
}

variable "service_account_name" {
    default = "gke-sa-01"
  
}

variable "node_pool_name" {
    default = "app-pool"
  
}

variable "machine-type" {
    default = "e2-medium"
  
}