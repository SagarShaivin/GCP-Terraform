resource "google_sql_database_instance" "instance" {
  name                = var.instance_name
  region              = var.region
  database_version    = var.db_version
  deletion_protection = false

  settings {
    tier = var.db_tier
  }
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.instance.name
}