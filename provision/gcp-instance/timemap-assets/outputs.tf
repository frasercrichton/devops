output "GCP_instance_ip" {
  value = google_compute_instance.timemap_vm.network_interface.0.access_config.0.nat_ip
}

output "name_servers" {
  value = google_dns_managed_zone.forensic_architecture_base_zone.name_servers
}
