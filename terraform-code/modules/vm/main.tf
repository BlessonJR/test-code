resource "google_compute_instance" "bastion-host" {
  name         = var.instance-name
  machine_type = var.vm-size
  zone = var.zone


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size = "50"
      labels = {
        hostname = var.instance-name
      }
    }
  }

 
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = var.vpc_network_name
    subnetwork = var.subnetwork_name
  }

  metadata = {
    hostname = var.instance-name
  }

  metadata_startup_script = "${file("/home/blesson_raju_2022/gke/test/code-challenge/modules/script/startup.sh")}"
      


  service_account {
    
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}