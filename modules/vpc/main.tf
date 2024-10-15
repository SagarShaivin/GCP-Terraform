resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  project                 = var.project
  auto_create_subnetworks = "false"
}

# ------------------------------------------------------------------------------
#  Creating Subnets
# ------------------------------------------------------------------------------

# Public Subnet
resource "google_compute_subnetwork" "public_subnet1" {
  name          = "public-subnet-a"
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.public_subnet_cidr
  region        = var.region
  description   = "This subnet is public subnet and containing bstion-host."
}

# Private Subnet
resource "google_compute_subnetwork" "private_subnet1" {
  name                     = "private-subnet-a"
  network                  = google_compute_network.vpc.id
  ip_cidr_range            = var.private_subnet_cidr
  region                   = var.region
  description              = "This subnet is private subnet and containing app-instance."
  private_ip_google_access = true
}

# Data Subnet
resource "google_compute_subnetwork" "data_subnet1" {
  name                     = "data-subnet-a"
  network                  = google_compute_network.vpc.id
  ip_cidr_range            = var.data_subnet_cidr
  region                   = var.region
  description              = "This subnet is private subnet and containing data-instance."
  private_ip_google_access = true
}


# ------------------------------------------------------------------------------
#  Routes and Route Gateways
# ------------------------------------------------------------------------------

# Internet Gateway

# Nat Gateway
resource "google_compute_router_nat" "nat_gateway" {
  name = "triage-nat-gateway"

  # attaching gateway to the routetable(router)
  router                             = google_compute_router.nat_router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

# Route Table
resource "google_compute_router" "nat_router" {
  network = google_compute_network.vpc.id
  region  = var.region
  name    = "nat-router"
}

# ------------------------------------------------------------------------------
#  Creating Static IP
# ------------------------------------------------------------------------------
# resource "google_compute_address" "bastion_static_ip" {
#   name   = "webphone-bastion-static-ip"
#   region = var.region
# }

# # Creating Static IP for App(Elastic IP)
# resource "google_compute_address" "app_instance_static_ip" {
#   name   = "app-static-ip"
#   region = var.region
# }
