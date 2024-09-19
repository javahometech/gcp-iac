provider "google" {
  project = "eastern-robot-423518-t9"
  credentials = file("~/Downloads/eastern-robot-423518-t9-cac40b6b68c1.json")
  region = "us-central1"
}

# Create VPC Network using custom subent creation mode
resource "google_compute_network" "vpc_network" {
  name = "vpc-network-hari"
  auto_create_subnetworks = false
}

# Create VPC subnetwork

resource "google_compute_subnetwork" "sub1" {
  network = google_compute_network.vpc_network.id
  name = "hari-subnet1"
  ip_cidr_range = "10.0.0.0/22"
}

# Create second subnet

resource "google_compute_subnetwork" "sub2" {
  network = google_compute_network.vpc_network.id
  name = "hari-subnet2"
  ip_cidr_range = "10.1.0.0/22"
}


