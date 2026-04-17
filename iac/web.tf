resource "docker_container" "web" {
  name  = "web-${terraform.workspace}-01"
  image = "lab/web-"

  ports {
    internal = "80"
    external = "4001"
  }
}
