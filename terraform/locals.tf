locals {
  # Service APIs to enable
  services = toset([
    "iam.googleapis.com",                  # Identity and Access Management (IAM) API
    "iamcredentials.googleapis.com",       # IAM Service Account Credentials API
    "cloudresourcemanager.googleapis.com", # Cloud Resource Manager API
    "compute.googleapis.com",              # Compute Engine
    "logging.googleapis.com",              # Logging
    "monitoring.googleapis.com",           # Monitoring
    "run.googleapis.com",                  # Cloud Run
  ])

  # The list of permissions that the Cloud Run service account needs
  service_roles = [
    "roles/run.invoker",
    "roles/secretmanager.secretAccessor",
  ]
}
