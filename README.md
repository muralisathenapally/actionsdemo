# Table of Contents

- [Overview](#overview)
- [Repo Structure](#repo-structure)
- [Pre-requisites](#pre-requisites)
- [Steps](#steps-to-run-terragrunt)
- [Modules](#modules)
  - [GKE](#gke-module)
  - [IAM](#iam-module)
  - [GCS Buckets](#buckets-module)
  - [Artifact Registry](#artifact-registry-module)

## Overview

This repository provides Terraform modules and configurations to manage core GCP resources: GKE clusters, IAM roles and policies, GCS buckets, and Artifact Registry repositories. All resources were initially created manually and have now been imported and managed via Terraform using Terraformer and Terragrunt.

## Repo Structure
| Name          | Description                          |
|---------------|--------------------------------------|
| `main.tf`     | This is the main terraform configuration file for the resource. main.tf will be using variables defined in variables.tf and output values in outputs.tf. Also main.tf keeps resource logic isolated and reusable across environments.   |
| `variables.tf`| Declares all input variables for the module. Documents each variable's type and description for maintainability.            |
| `outputs.tf`  | Declares outputs from the module.    |
| `terragrunt.hcl` | Acts as the configuration entrypoint for each resource type in dev environment. Specifies which Terraform module to use, passes environment and resource-specific inputs, and configures remote state/backends. terragrunt.hcl for each resource has its own source pointed in modules section.            |
| `root.hcl` | This is the shared configuration for the whole dev environment, such as remote state backend, common variables. Ensures consistency across all resources.       |
| `.gitignore` | ignores temp files            |




### Pre-requisites
- Git
- Gcloud SDK
- Terraform
- Terragrunt

### Steps to run Terragrunt
  1. Auth with GCP
 ```
gcloud auth login
```
  
  2. Clone the Repository
```
git clone https://github.com/Flyreel/flyreel-terraform-iac.git
cd flyreel-terraform-iac
```
 
 3. Initialize Terragrunt
```
terragrunt init
```

 4. Review the changes
```
terragrunt plan
```

 5. Apply the changes
```
terragrunt apply
```


## Modules
### GKE module
This module will help create GKE cluster and custom nodepool with the customized inputs. This will also delete default node pool that gets created with cluster.

| Input Name             | Description                                          |
|------------------------|------------------------------------------------------|
| `cluster_name`         | Name of the GKE cluster                              |
| `nodepool_name`        | Name of the node pool                                |
| `network`              | Name of the VPC network                              |
| `sub_network`          | Name of the subnetwork (must be in the same region)  |
| `node_count`           | Initial number of nodes in the node pool             |
| `total_max_node_count` | Maximum number of nodes for autoscaling              |
| `machine_type`         | Machine type for nodes (e.g., `e2-medium`)           |
| `disk_size`            | Size of the boot disk in GB                          |
| `disk_type`            | Type of the disk (e.g., `pd-standard`, `pd-balanced`)|
| `node_pool_label`      | Labels to assign to the node pool                    |


| Resource          | Path Format                          |
|-------------------|--------------------------------------|
| `network`         | projects/<PROJECT_ID>/global/networks/<VPC_NAME>  |
| `subnetwork`      | projects/<PROJECT_ID>/regions/<REGION>/subnetworks/<SUBNETWORK_NAME>|


[gke reference](/dev/gke-blue/terragrunt.hcl)



### IAM module
This module helps create IAM bindings, IAM members and Service Accounts for a given resource, allowing us to manage access control with custom roles and members.

| Input Name        | Description                                              |
|-------------------|----------------------------------------------------------|
| `service_accounts`| List of service accounts to create. Each item contains:  |
|     `name`        | Service account ID    |
|   `display_name`  |  Display name  |
|   `description`   | Description of the service account |



| Input Name                   | Description                                                                                  |
|------------------------------|----------------------------------------------------------------------------------------------|
| `iam_bindings`               | Map of member identifiers to a list of roles. Each key represents a member type and ID.      |
| `serviceAccount:<SA_EMAIL>`  | Grants roles to a specific service account using its email address.                         |
| `user:<EMAIL>`               | Grants roles to an individual user identified by their email address.                       |
| `group:<GROUP_EMAIL>`        | Grants roles to a Google Group identified by its group email address.                       |

**Note:** Each value in the iam_bindings map is a list of IAM roles to assign (e.g., roles/editor, roles/viewer).

[IAM reference](/dev/iam/terragrunt.hcl)

### Buckets module
This module helps create Google Cloud Storage (GCS) buckets with customizable configurations such as location, storage class, access control, and versioning.

| Input Name| Description     |
|---------------------|-----------------------------------------------------------------------------|
| `bucket_name`       | Name of the GCS bucket                                                      |
| `location`          | Region or multi-region where the bucket will be created (e.g., `US`, `us-central1`) |
| `storage_class`     | Storage class of the bucket (e.g., `STANDARD`, `NEARLINE`, `ARCHIVE`, `COLDLINE`) |
| `force_destroy`     | Whether to delete all objects inside the bucket when destroying (`true`/`false`) |
| `versioning`        | Enable object versioning for the bucket (`true`/`false`)                    |
| `uniform_access`    | Enable uniform bucket-level access (`true`/`false`)                         |
| `labels`            | Key-value map of labels to assign to the bucket                             |
| `retention_period`  | Retention period for objects (in seconds) — must be ≥ 1 day (e.g., `86400`) |
| `is_locked`         | Whether the retention policy is locked and cannot be removed (`true`/`false`) |

[buckets reference](/dev/buckets/terragrunt.hcl)


### Artifact Registry module
This module helps create Artifact Registry repositories with with customizable options such as format, location, access settings, support for Docker, and cleanup policies.

| Input Name          | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| `repositories`      | List of repositories to create. Each item supports the following fields:    |
| `repository_id`     |  Name/ID of the repository                         |
| `repo_format`       | Format of the repo (e.g., `DOCKER`, `MAVEN`)      |
| `location`          |  Region where the repo is created (e.g., `us-central1`) |
| `repo_mode`         |  Mode of the repo (`STANDARD_REPOSITORY` or `VIRTUAL_REPOSITORY`) |
| `cleanup_policies`  |  List of cleanup rules for retention. Each includes: `id` – Unique name for the policy, `action` – Action to take (`KEEP` or `DELETE`),  `keep_count` – Number of versions to retain |

[Artifact-Registry reference](/dev/artifact-registry/terragrunt.hcl)
