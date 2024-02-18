variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
}

variable "api_gateway_path" {
  description = "Api Gateway path"
}

variable "api_gateway_name" {
  description = "Api Gateway name"
}

variable "lambda_function_name" {
  description = "Lambda function name"
}

variable "lambda_role_name" {
  description = "Lambda role name"
}

variable "api_gateway_stage_name" {
  description = "Api gateway stage name"
}
variable "lambda_source_zip" {
  description = "Lambda source zip file"
}
variable "lambda_policy_name" {
  description = "Lambda policy name"
}

variable "github_token" {
  description = "GitHub Access Token"
  sensitive   = true
}

variable "repo_name" {
  description = "github repository name"
}

variable "webhook_name" {
  description = "github webhook name"
}



