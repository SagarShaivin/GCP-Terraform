output "private_ip" {
  value = google_compute_instance.compute_instance.network_interface[0].network_ip
}

output "instance_id" {
  value = google_compute_instance.compute_instance.id
}