resource "google_compute_global_address" "external_ip" {
  name = "lb-external-ip"
}


# HTTP forwarding rule
resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name                  = "http-forwarding-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.http_proxy.id
  # network               = var.network
  # subnetwork = var.private_subnet
  ip_address = google_compute_global_address.external_ip.address
}



# HTTP target proxy
resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "target-http-proxy"
  url_map = google_compute_url_map.triage_url_map.id
}



# URL map
resource "google_compute_url_map" "triage_url_map" {
  name            = "regional-url-map"
  default_service = google_compute_backend_service.app_backend_service.id
}


resource "google_compute_backend_service" "app_backend_service" {
  name = "app-backend-subnet"

  port_name     = "http"
  protocol      = "HTTP"
  timeout_sec   = 300
  health_checks = [google_compute_health_check.default_healthcheck.id]
  backend {
    group          = var.instance_group
    balancing_mode = "UTILIZATION"
  }
}



# health check
resource "google_compute_health_check" "default_healthcheck" {
  name = "default-healthcheck"

  http_health_check {
    port = "80"
  }
}
