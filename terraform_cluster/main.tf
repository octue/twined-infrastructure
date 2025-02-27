terraform {
  required_version = ">= 1.8.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>6.12"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~>2.35"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~>1.19"
    }
  }

  cloud {
    organization = "octue"
    workspaces {
      project = "octue-twined"
      tags = ["services"]
    }
  }
}


provider "google" {
  project     = var.google_cloud_project_id
  region      = var.google_cloud_region
}


data "google_client_config" "default" {}


provider "kubernetes" {
  host                   = "https://${module.octue_twined_cluster.kubernetes_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.octue_twined_cluster.kubernetes_cluster.master_auth[0].cluster_ca_certificate)
}


provider "kubectl" {
  load_config_file       = false
  host                   = "https://${module.octue_twined_cluster.kubernetes_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.octue_twined_cluster.kubernetes_cluster.master_auth[0].cluster_ca_certificate)
}


# Get the environment name from the workspace.
locals {
  workspace_split = split("-", terraform.workspace)
  environment = element(local.workspace_split, length(local.workspace_split) - 1)
}


module "octue_twined_cluster" {
  source = "git::github.com/octue/terraform-octue-twined-cluster.git?ref=create-initial-module"
  google_cloud_project_id = var.google_cloud_project_id
  google_cloud_region = var.google_cloud_region
  environment = local.environment
  storage_bucket_name = var.storage_bucket_name
  cluster_queue = var.cluster_queue
  deletion_protection = var.deletion_protection
}
