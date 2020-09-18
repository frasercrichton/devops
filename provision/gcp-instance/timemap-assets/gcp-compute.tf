resource "google_compute_instance" "timemap_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.region

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = file("files/assets.sh")

  depends_on = [google_storage_bucket.timemap_bucket]

}
