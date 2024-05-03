resource "google_project_service" "service" {
  for_each           = local.services
  project            = var.project
  service            = each.value
  disable_on_destroy = false
}
