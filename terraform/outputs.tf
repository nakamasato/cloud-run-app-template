output "github_actions_provider_name" {
  value = module.gh_oidc.provider_name
}

output "github_actions_sa_name" {
  value = google_service_account.github_actions.name
}
