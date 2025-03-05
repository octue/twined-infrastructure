variable "google_cloud_project_id" {
  type = string
  default = "octue-twined-services"
}


variable "google_cloud_region" {
  type = string
  default = "europe-west9"
}


variable "cluster_queue" {
  type = object(
    {
      name                 = string
      max_cpus              = number
      max_memory            = string
      max_ephemeral_storage = string
    }
  )
  default = {
    name                  = "cluster-queue"
    max_cpus              = 100
    max_memory            = "256Gi"
    max_ephemeral_storage = "10Gi"
  }
}


variable "deletion_protection" {
  type    = bool
  default = false
}
