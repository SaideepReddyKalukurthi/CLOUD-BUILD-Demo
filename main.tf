terraform {
    backend "gcs" {
        bucket = "terraform-gcs-backend-state"
         prefix = "cloud-build-demo/state"
    }
 required_providers {
   google = {
       source = "hashicorp/google"
   }
 }   
}


provider "google" {
    project = "terraform-practice-001"
    region ="asia-south1"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }



  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

}

#saideep reddy