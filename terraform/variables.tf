variable "project" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "The region to create resources in"
  type        = string
  default     = "asia-northeast1"
}

### Cloud Run config start ###
variable "image" {
  description = "The container image to deploy to Cloud Run"
  type        = string
  default     = "gcr.io/cloudrun/hello:latest"
}

variable "service_name" {
  description = "The name of the Cloud Run service. This is also used as the name of the service account."
  type        = string
}

variable "is_public" {
  description = "Whether to allow unauthenticated access to the Cloud run service"
  type        = bool
  default     = false
}

### Cloud Run config end ###

### GitHub Actions start ###
variable "github_owner" {
  description = "The owner of the GitHub repository"
  type        = string
}

variable "github_repository" {
  description = "The name of the GitHub repository"
  type        = string
}

variable "github_actions_sa_name" {
  description = "The name of the service account for GitHub Actions"
  default     = "github-actions"
  type        = string
}

variable "gh_oidc_pool_id" {
  description = "The ID of the Workload Identity Pool for GitHub Actions"
  default     = "github-actions"
  type        = string
}

variable "gh_oidc_provider_id" {
  description = "The ID of the OIDC provider for GitHub Actions"
  default     = "github-actions"
  type        = string
}

### GitHub Actions config end ###
