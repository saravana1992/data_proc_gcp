
provider "google" {
  project     = var.project_id
  region      = var.region_name
}

resource "google_dataproc_cluster" "mycluster" {
  name     = var.cluster_name
  region   = var.region_name
  labels = {
    product = "contentiq"
    component = "contentiq-dataproc"
  }

  cluster_config {
    #delete_autogen_bucket = var.delete_autogen_bucket
    staging_bucket = var.staging_bucket

    autoscaling_config {
    policy_uri = var.policy_uri
    }

    master_config {
      num_instances = 3
      machine_type  = var.master_machine_type
      disk_config {
        boot_disk_type    = var.master_boot_disk_type
        boot_disk_size_gb = var.master_boot_disk_size_gb
      }
    }

    worker_config {
      num_instances    = var.worker_num_instances
      machine_type     = var.worker_machine_type
      min_cpu_platform = "Intel Skylake"
      disk_config {
        boot_disk_type    = var.worker_boot_disk_type
        boot_disk_size_gb = var.worker_boot_disk_size_gb
        num_local_ssds    = var.worker_num_local_ssds
      }
    }

    preemptible_worker_config {
      num_instances = 0
    }

    # Override or set some custom properties
    software_config {
      image_version = var.image_version
      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
      }
    }

    gce_cluster_config {
      network = var.network
      zone = var.zone_name
      metadata = {
          block-project-ssh-keys = "true"
          can-ip-forward = "off"
        }
      service_account_scopes = [
        "https://www.googleapis.com/auth/monitoring",
        "useraccounts-ro",
        "storage-rw",
        "logging-write",
      ]
    }

    # You can define multiple initialization_action blocks
    initialization_action {
      script      = var.init_action
      timeout_sec = 500
    }
  }
}
