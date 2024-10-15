output "vpc_name" {
  value = google_compute_network.vpc.name
}

# output "public_subnet1" {
#   value = google_compute_subnetwork.public_subnet1.id
# }

output "private_subnet1" {
  value = google_compute_subnetwork.private_subnet1.id
}

# output "data_subnet1" {
#   value = google_compute_subnetwork.data_subnet1.id
# }