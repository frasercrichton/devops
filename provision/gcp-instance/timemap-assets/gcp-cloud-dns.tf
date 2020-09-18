resource "google_dns_managed_zone" "forensic_architecture_base_zone" {
  name        = "forensic-architecture-base-zone"
  dns_name    = "${var.domain}."
  description = "Forensic Architecture Base DNS zone"
  labels = {
    "organisation" = "forensic-architecture"
  }
}

resource "google_dns_record_set" "a_record" {
  name         = google_dns_managed_zone.forensic_architecture_base_zone.dns_name
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.forensic_architecture_base_zone.name
  rrdatas      = [google_compute_instance.timemap_vm.network_interface.0.access_config.0.nat_ip]
}

resource "google_dns_record_set" "cname" {
  name         = "www.${google_dns_managed_zone.forensic_architecture_base_zone.dns_name}"
  type         = "CNAME"
  ttl          = 300
  managed_zone = google_dns_managed_zone.forensic_architecture_base_zone.name
  rrdatas      = [google_dns_managed_zone.forensic_architecture_base_zone.dns_name]
}
