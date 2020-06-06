  
variable "cluster_name" {
    type = string
    description = "The name of the cluster, unique within the project and zoneData"
    default = ""
}

variable "project_id" {
    type =  string
    description = "The project in which the cluster will exist"
    default = ""
}

variable "region_name" {
    type =  string
    description = "The region in which the cluster and associated nodes will be created in"
    default = "us-west2"
}

variable "zone_name" {
    type =  string
    description = "The region in which the cluster and associated nodes will be created in"
    default = "us-west2-a"
}

variable "delete_autogen_bucket" {
    description = "If this is set to true, upon destroying the cluster, if no explicit staging_bucket was specified (i.e. an auto generated bucket was relied upon) then this auto generated bucket will also be deleted as part of the cluster destroy"
    default     = "false"
}

variable "staging_bucket" {
    type =  string
    description = "The Cloud Storage staging bucket used to stage files, such as Hadoop jars, between client machines and the cluster"
    default =   ""
}

variable "policy_uri" {
    type =  string
    description = "Specifies the policy uri"
    default     = ""
}

variable "master_num_instances" {
    type = number
    description = "Specifies the number of master nodes to create"
    default     = 3
}

variable "master_machine_type" {
    description = "The name of a Google Compute Engine machine type to create for the master"
    default     = "n1-standard-8"
}

variable "master_boot_disk_type" {
    description = "type of the primary disk "
    default     = "pd-ssd"
}

variable "master_boot_disk_size_gb" {
    type = number
    description = "Size of the primary disk attached to each node, specified in GB"
    default     = 200
}

variable "worker_num_instances" {
    type = number
    description = "Specifies the number of worker nodes to create"
    default     = 8
}

variable "worker_machine_type" {
    description = "The name of a Google Compute Engine machine type to create for the worker nodes"
    default     = "n1-highmem-64"
}

variable "worker_boot_disk_type" {
    description = "type of the worker primary disk attached"
    default     = "pd-standard"
}

variable "worker_boot_disk_size_gb" {
    type = number
    description = "Size of the primary disk attached to each worker node, specified in GB"
    default     = 200
}

variable "worker_num_local_ssds" {
    type = number
    description = "The amount of local SSD disks that will be attached to each worker cluster node"
    default     = 4
}

variable "preemptible_num_instances" {
    type = number
    description = "Specifies the number of preemptible nodes to create"
    default     = 0
}

variable "image_version" {
    description = "The Cloud Dataproc image version to use for the clustere"
    default     = ""
}

variable "network" {
    description = "The network to be use for the cluster"
    default     = ""
}

variable "init_action" {
    description = "initialization_action"
    default     = ""
}
