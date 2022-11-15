
module "service_account" {
    source = "./modules/service_account"
    project_id = var.project_id
    service_account_name = var.service_account_name
  
}
module "network" {
    source = "./modules/networks"
    project_id = var.project_id
    vpc_name = var.vpc_name
    subnet_name = var.subnet_name
    subnet_cidr = var.subnet_cidr
    region = var.region  
}

module "gke" {
    source = "./modules/gke"
    cluster_name = var.cluster_name
    region = var.region
    project_id = var.project_id
    pod_ip_range = var.pod_ip_range
    services_ip_range = var.services_ip_range
    vpc_network_name = module.network.vpc_network_name
    subnetwork_name = module.network.subnetwork_name
    cluster_master_range = var.cluster_master_range  
}

module "node-pool" {
    source = "./modules/node-pool"
    region = var.region
    node_pool_name = var.node_pool_name
    cluster-name = module.gke.cluster-name
    project_id = var.project_id
    machine-type = var.machine-type
    service_account_email = module.service_account.service_account_email
}
