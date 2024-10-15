resource "google_compute_firewall" "firewall_access" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = var.protocol
    ports    = var.ports
  }

  source_ranges = var.source_range
  target_tags   = var.target_tags
}