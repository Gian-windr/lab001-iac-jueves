resource "docker_image" "postgres" {
  name         = "postgres:15"
  keep_locally = true
}

resource "docker_container" "db" {
  name  = "db-${terraform.workspace}-01"
  image = docker_image.postgres.image_id
  ports {
    internal = 5432
    external = var.db_port[terraform.workspace]
  }
  env = [
    "POSTGRES_PASSWORD=admin123"
  ]
}