terraform {
  required_version = ">= 1.8.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>6.12"
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


module "octue_twined_core" {
  source = "git::github.com/octue/terraform-octue-twined-core.git?ref=create-initial-module"
  google_cloud_project_id = var.google_cloud_project_id
  google_cloud_region = var.google_cloud_region
  github_organisation = var.github_organisation
  maintainer_service_account_names = var.maintainer_service_account_names
  deletion_protection = var.deletion_protection
}
