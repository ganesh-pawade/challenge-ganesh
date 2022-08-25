# Test

# Overview

| Name | Description | SelfLink
|------|-------------|------|
| Challenge#1 | 3 Tier Environment Deployment | [Terraform](https://github.com/ganesh-pawade/kpmg/tree/main/gcp-terraform-skeleton) |
| | Sample Architecture Diagram | [Architecture_diag](https://github.com/ganesh-pawade/challenge-ganesh/blob/main/gp-sample-drawio.pdf) |
| Challenge#2 | MetaData of Instance | [Metadata_script](https://github.com/ganesh-pawade/challenge-ganesh/blob/main/gcp-terraform-skeleton/env/prod/regional_resources/us-central1/gce_groups/app_group/main.tf) |
| Challenge#3 | Nested Object Script | [Shell_script](https://github.com/ganesh-pawade/challenge-ganesh/blob/main/Nested%20object%20script/script.sh) |

![image](https://user-images.githubusercontent.com/55939521/184165565-c2d63dd2-d9f6-4211-916b-8327b6270b21.png)



# Challenge#1

This module makes it easy to deploy resources for 3 tier architecture using terraform IaC tool.
Used Module Structure for creating terraform code.

- One compute Engine
- Cloud storage bucket
- HTTP load balancer
- Cloud NAT
- Cloud SQL

# Challenge#2

Query to get the Metadata of Instance in JSON format.

```hcl
metadata_startup_script = <<-EOF
  curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/?recursive=true" -H "Metadata-Flavor: Google" > /metadata.txt
  EOF
```
# Challenge#3

| Name | Description | SelfLink
|------|-------------|------|
| Challenge#3 | Nested Object Script | [Shell_script](https://github.com/ganesh-pawade/kpmg/tree/main/Nested%20object%20script) |


* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
