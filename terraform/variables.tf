variable "project" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "The region to create resources in"
  type        = string
  default     = "asia-northeast1"
}

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

# variable "github_owner" {
#   description = "The owner of the GitHub repository"
#   type        = string
#   default     = "nakamasato"
# }

# variable "github_repo" {
#   description = "The name of the GitHub repository"
#   type        = string
# }

# variable "slack_bot_user_oauth_token" {
#   description = "slack bot user token"
#   type        = string
#   sensitive   = true
#   default     = "dummy"
# }
