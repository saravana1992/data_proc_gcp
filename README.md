# Data_proc - GCP


# This document explains how to deploy the data proc using the terraform

1. Open Google cloud shell
2. By default terraform installed in cloud shell, 
3. Clone the below repository 
$ git clone https://github.com/saravana1992/data_proc.git

4. Modify the variables file with the details
  
-> "cluster_name" = ""
-> "project_id"  = ""
->  "region_name"  = "us-west2"
-> "zone_name" = "us-west2-a"
->  "Staging_bucket"  =  "" 
->"policy_uri" = ""
->  "master_num_instances"  = 3
->  "master_machine_type"   = "n1-standard-8"
->  "master_boot_disk_type" = "pd-ssd"
->  "master_boot_disk_size_gb"  = 200
-> "worker_num_instances" = 8
->  "worker_machine_type"    = "n1-highmem-64"
-> "worker_boot_disk_type" = "pd-standard"
->  "worker_boot_disk_size_gb"  = 200
-> "worker_num_local_ssds"   = 4
-> "preemptible_num_instances"  = 0
-> "image_version"  = ""
-> "network"   = ""
-> "init_action"   = ""

5. Enable Dataproc service API

$ gcloud services enable dataproc.googleapis.com

6. Change directory to the folder and execute terraform commands

$ terraform init
$ terraform plan
$ terraform apply

7. After the terraform ran successfully, then to view the details of a cluster, run:

 $ gcloud dataproc clusters describe my_cluster --region=us-west2


