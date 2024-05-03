locals {
  # Service APIs to enable
  # Please edit this list to match your requirements
  services = toset([
    "iam.googleapis.com",                  # Identity and Access Management (IAM) API
    "iamcredentials.googleapis.com",       # IAM Service Account Credentials API
    "cloudresourcemanager.googleapis.com", # Cloud Resource Manager API
    "compute.googleapis.com",              # Compute Engine
    "logging.googleapis.com",              # Logging
    "monitoring.googleapis.com",           # Monitoring
    "run.googleapis.com",                  # Cloud Run
  ])

  # The list of roles to grant to the GitHub Actions service account
  # Please edit this list to match your requirements
  github_actions_roles = [
    "roles/iam.workloadIdentityUser",        # To allow GitHub Actions to use Workload Identity
    "roles/iam.serviceAccountAdmin",         # To manage other service account
    "roles/resourcemanager.projectIamAdmin", # GitHub Actions identity
    "roles/run.developer",                   # To allow GitHub Actions to deploy to Cloud Run
    # "roles/run.admin",                       # to grant run.invoker (Permission 'run.services.setIamPolicy' is necessary)
    "roles/storage.objectUser", # GitHub Actions needs write/read permission for GCS to manage terraform state file
    # "roles/secretmanager.admin",             # allow configure google_secret_manager_secret_iam_binding
    # "roles/secretmanager.secretAccessor",    # If you manage Secret Manager by GitHub Actions
    # "roles/editor",                         # If you manage other resources by GitHub Actions
  ]

  # The list of permissions that the Cloud Run service account needs
  # Please edit this list to match your requirements
  service_roles = [
    "roles/run.invoker",
    "roles/secretmanager.secretAccessor",
  ]
}
