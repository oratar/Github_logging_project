
provider "github" {
  token = var.github_token
}

resource "github_repository" "project_repo" {
  name        = var.repo_name
  description = "Your repository description"
  visibility      = "private"
  auto_init = true
}

#resource "github_repository_file" "initial_commit" {
#  repository          = github_repository.project_repo.name
#  branch              = "main"
#  file           = "README.md"
#  content             = "initializing"
#  commit_message      = "Managed by Terraform"
#  overwrite_on_create = true
#}

resource "github_branch" "dev_branch" {
  repository = github_repository.project_repo.name
  branch     = "develop"

}

resource "github_repository_webhook" "apigateway_webhook" {
  repository = github_repository.project_repo.name
#  name       = var.webhook_name
  events     = ["pull_request"]
  active     = true

  configuration {
    url          = "${aws_api_gateway_deployment.deployment.invoke_url}/${var.api_gateway_path}"
    content_type = "json"
    insecure_ssl = false
    #    secret       = "your-webhook-secret"  # Optional: Use a secret for additional security
  }
}

