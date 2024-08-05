# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
#before creating VPC in a new GCP project, you need to enable compute API
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

#to create a GKE cluster you also nneed to enable container google API
resource "google_project_service" "container" {
  service = "container.googleapis.com"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "main" {
  name                            = "main"
  routing_mode                    = "REGIONAL" # we have 2 options here i.e. REGIONAL or GLOBAL
  auto_create_subnetworks         = false # if false then the network is created in custom subnet mode and let us decide our own subnets.
  mtu                             = 1460 # Maximum transmission units in bytes
  delete_default_routes_on_create = false # if you set this value to true, it will delete the different route to the internet. We need to explicitly specify resources that need to be created before creating VPC.

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}
