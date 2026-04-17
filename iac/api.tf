resource "docker_container" "api" {
  name  = "api-${terraform.workspace}-01"
  image = "web02:latest"
  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }
}