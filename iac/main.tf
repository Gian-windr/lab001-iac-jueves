resource "docker_network" "app_net" {
  name = "app-net-${terraform.workspace}"
}