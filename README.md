# cloud-run-app-template

This is a template for a Cloud Run app.

You can initialize a GitHub repository to manage Cloud Run services with Terraform:

- Deploy a Cloud run service with Terraform
- Set up a GitHub Actions workflow for the Terraform

## Steps

1. Create a repo from this template.

    ```
    gh repo create <your new repo name> --template=nakabonne/cloud-run-app-template
    ```

1. Create a GCS bucket for Terraform backend if needed (optional).

    ```
    gsutil mb -p "<gcp project>" -l "<region>" gs://"<bucket>"
    ```

1. Write your own config files.

    `terraform.tfvars`:
    ```hcl
    project      = "<gcp project>"
    region       = "<region>"
    service_name = "<Cloud Run service name>"
    ```
    `terraform.tfbackend`:
    ```hcl
    bucket  = "<bucket for Terraform state>"
    ```

1. Run `terraform init -backend-config=terraform.tfbackend`
1. Run `terraform apply`
1. Set up GitHub Actions secrets `PROVIDER_NAME` and `SA_EMAIL`.

    ```
    gh secret set PROVIDER_NAME --body=$(terraform output github_actions_provider_name | tr -d '"')
    gh secret set SA_EMAIL --body=$(terraform output github_actions_sa_email | tr -d '"')
    ```

1. Push to your repo.

For more details, please read [terraform](terraform/README.md).

## Application

TBD

## Ref

1. [terraform-google-cloud-run](https://github.com/GoogleCloudPlatform/terraform-google-cloud-run)
1. [terraform-google-modules/terraform-google-github-actions-runners](https://github.com/terraform-google-modules/terraform-google-github-actions-runners/tree/v3.1.2/modules/gh-oidc)
