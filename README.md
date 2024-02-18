# Github_logging_project


## Overview

This project demonstrates automated logging of pull requests to an S3 bucket,  utilizes Terraform to provision AWS resources including a Lambda function (written in Python), an API Gateway, an S3 bucket, and a GitHub repository. 
A GitHub webhook triggers the Lambda function via the API Gateway, logging changes from merged pull requests to improve cooperation and increase transparency within development processes.

## Project Structure

-   **`terraform/`**: Contains Terraform configuration files for provisioning AWS resources and Github repository.
-   **`lambda_source/`**: Contains the Lambda function written in Python and the zip file which includes all the dependencies.
-   **`README.md`**: Documentation file for the project.
-   **`.fitignore`**: Specifies intentionally untracked files that Git should ignore.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

-   [Terraform](https://www.terraform.io/) installed.
-   AWS credentials configured.
-   Github token.

## Configuration

Customize the project by adjusting the Terraform variables. See `terraform/variables.tf` for Terraform variables declarations and adapt the values in `terraform/variables.tfvars`.

## Deploy the Project

1.  Clone the repository:

`git clone <repository-url>
cd <repository-directory>` 

2.  Initializing Terraform

`terraform init` 

3.  Check the resources Terraform will provision. 

`terraform plan -var=github_token=<your_github_token>`

4.  Provision all the resources.

``terraform apply-var=github_token=<your_github_token>``  

## Usage

After deployment, create and merge the pull request in the GitHub repository. The webhook will trigger the Lambda function, which checks if the pull request was merged. If merged, the changes are logged to the S3 bucket.
![image](https://github.com/oratar/Github_logging_project/assets/121873526/203b7287-016b-4c5c-99c7-20451227a1d3)


