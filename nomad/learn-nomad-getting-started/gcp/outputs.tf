output "nomad_ip" {
  value = "http://${google_compute_instance.server[0].network_interface.0.access_config.0.nat_ip}:4646/ui"
}

output "IP_Addresses" {
  value = <<CONFIGURATION

It will take a little bit for setup to complete and the UI to become available.
Once it is, you can access the Nomad UI at:

http://${google_compute_instance.server[0].network_interface.0.access_config.0.nat_ip}:4646/ui

Set the Nomad address, run the bootstrap, export the management token, set the token variable, and test connectivity:

export NOMAD_ADDR=http://${google_compute_instance.server[0].network_interface.0.access_config.0.nat_ip}:4646/ui && \
nomad acl bootstrap | grep -i secret | awk -F "=" '{print $2}' | xargs > nomad-management.token && \
export NOMAD_TOKEN=$(cat nomad-management.token) && \
nomad server members

Copy the token value and use it to log in to the UI:

cat nomad-management.token
CONFIGURATION
}