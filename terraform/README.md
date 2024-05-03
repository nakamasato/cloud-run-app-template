# Terraform

## Prerequisite

GCP project is already created and linked to a billing account.

```
PROJECT=cloud-run-template-naka
REGION=asia-northeast1
```

## Apply

Write your own `terraform.tfvars` file.

```
gcloud auth application-default login
```

```
terraform init
```

```
terraform apply
```

> [!WARNING]
> It might fail for the first time, because the Cloud Run service account is not created yet. Please try again.

## More

If you want to configure more, please refer to the following repositories.

- [terraform-google-cloud-run](https://github.com/GoogleCloudPlatform/terraform-google-cloud-run)
