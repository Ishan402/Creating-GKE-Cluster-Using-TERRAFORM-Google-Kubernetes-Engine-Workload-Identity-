# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = "devops-v4-431605"
  region  = "us-central1"
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "imshudikaman420"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
