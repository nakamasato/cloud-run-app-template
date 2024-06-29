module "cloud_run" {
  source  = "GoogleCloudPlatform/cloud-run/google"
  version = "~> 0.10.0"

  # Required variables
  service_name = var.service_name
  project_id   = var.project
  location     = var.region
  image        = var.image

  # Optional variables
  service_account_email = google_service_account.cloud_run.email
  template_annotations  = {
    "autoscaling.knative.dev/maxScale": 2,
    "autoscaling.knative.dev/minScale": 0,
    "generated-by": "terraform",
    "run.googleapis.com/client-name": "terraform"
  }
}

resource "google_service_account" "cloud_run" {
  account_id   = var.service_name
  display_name = var.service_name
}

resource "google_project_iam_member" "cloud_run" {
  for_each = toset(local.service_roles)
  project  = var.project
  role     = each.value
  member   = google_service_account.cloud_run.member
}

resource "google_cloud_run_service_iam_binding" "cloud_run" {
  count    = var.is_public ? 1 : 0
  location = module.cloud_run.location
  service  = module.cloud_run.service_name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}
