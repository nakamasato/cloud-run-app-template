# Terraform

## Prerequisite

GCP project is already created and linked to a billing account.

## Set up backend (optional)


> [!NOTE]
> You can skip this step if you use an existing bucket for Terraform state.

1. Set up variables.

    ```
    PROJECT="cloud-run-template-naka"
    REGION="asia-northeast1"
    BUCKET="cloud-run-template-naka-terraform"
    ```

1. Login

    ```
    gcloud auth login
    ```

1. Create a GCS bucket for Terraform state.

    ```
    gsutil mb -p "$PROJECT" -l "$REGION" gs://"$BUCKET"
    ```

## Initial Setup

1. Create your new GitHub repository from this template.

    ```
    gh repo create <your new repo name> --template=nakabonne/cloud-run-app-template
    ```

1. Write your own `terraform.tfvars` and `terraform.tfbackend` file.

    ```
    cp terraform.tfvars.example terraform.tfvars
    ```

    Example of `terraform.tfvars`:

    ```
    project      = "cloud-run-template-naka"
    region       = "asia-northeast1"
    service_name = "cloud-run-template"
    ```

    ```
    cp terraform.tfbackend.example terraform.tfbackend
    ```

    Example of `backend.tfbackend`:

    ```
    bucket  = "cloud-run-template-naka-terraform"
    prefix  = "terraform/state"
    ```

1. Log in to GCP.

    ```
    gcloud auth application-default login
    ```

1. Init

    ```
    terraform init -backend-config=terraform.tfbackend
    ```

1. Apply

    ```
    terraform apply
    ```

    > [!WARNING]
    > It might fail for the first time, because it takes some time to enable the Cloud Run service API. Please try again.

1. Set GitHub repository secrets

    ```
    gh secret set PROVIDER_NAME --body=$(terraform output github_actions_provider_name | tr -d '"')
    gh secret set SA_EMAIL --body=$(terraform output github_actions_sa_email | tr -d '"')
    ```

1. Create a PR!

    GitHub Actions will be run with the service account created by Terraform.

## More

If you want to configure more, please refer to the following repositories.

- [terraform-google-cloud-run](https://github.com/GoogleCloudPlatform/terraform-google-cloud-run)
- [terraform-google-modules/terraform-google-github-actions-runners](https://github.com/terraform-google-modules/terraform-google-github-actions-runners/tree/v3.1.2/modules/gh-oidc)

## Clean up

> [!WARNING]
> This will delete all resources created by Terraform.

```
terraform destroy
```
