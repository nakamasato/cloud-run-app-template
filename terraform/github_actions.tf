resource "google_service_account" "github_actions" {
  project      = var.project
  account_id   = var.github_actions_sa_name
  display_name = var.github_actions_sa_name
  description  = "link to Workload Identity Pool used by GitHub Actions"
}

resource "google_project_iam_member" "github_actions" {
  project = var.project
  for_each = {
    for role in local.github_actions_roles : role => role
  }
  role   = each.value
  member = google_service_account.github_actions.member
}

module "gh_oidc" {
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  project_id  = var.project
  pool_id     = var.gh_oidc_pool_id
  provider_id = var.gh_oidc_provider_id
  sa_mapping = {
    "github-actions" = {
      sa_name   = google_service_account.github_actions.name
      attribute = "attribute.repository/${var.github_owner}/${var.github_repository}"
    }
  }
}

resource "github_actions_secret" "sa_email" {
  repository      = var.github_repository
  secret_name     = "SA_EMAIL"
  plaintext_value = google_service_account.github_actions.email
}

resource "github_actions_secret" "provider_name" {
  repository      = var.github_repository
  secret_name     = "PROVIDER_NAME"
  plaintext_value = module.gh_oidc.provider_name
}