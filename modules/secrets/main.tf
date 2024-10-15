resource "google_secret_manager_secret" "secret-basic" {
  secret_id = var.secret_name

  labels = {
    label = var.secret_label
  }

  replication {
    auto {}
  }
}
