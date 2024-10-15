resource "google_compute_instance" "compute_instance" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.az

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {

    network    = var.network
    subnetwork = var.subnetwork

    access_config {
      # nat_ip = var.static_ip
    }
  }

  metadata = {
    # Ssh Key
    ssh-keys = "${var.ssh_user}:${file(var.ssh_public_key)}"
  }

  allow_stopping_for_update = true

  tags = var.instance_tag
}