import json
from github import Github
import boto3
from datetime import datetime, timedelta
import requests
import os

def lambda_handler(event, context):
    merged_bool = event['pull_request'].get('merged')
    if merged_bool:
        parsed_date = datetime.strptime(event['pull_request']['merged_at'], "%Y-%m-%dT%H:%M:%SZ")
        formatted_date = (parsed_date + timedelta(hours=2)).strftime("%d.%m.%Y-%H:%M")

        github_token = os.environ['github_token']
        g = Github(github_token)
        repo = g.get_repo(event['repository']['full_name'])
        pull_request = repo.get_pull(event['pull_request']['number'])

        changed_files = ""

        for file in pull_request.get_files():
            changed_files += f"{file.filename}: {file.status}\n"

        s3 = boto3.resource('s3')
        s3_bucket_name = "git-changes-bucket"
        s3_key = event['pull_request']['base']['repo']['name']+"/"+formatted_date
        s3.Object(s3_bucket_name, s3_key).put(Body=changed_files)

        result = "Pull request is merged, successfully uploaded logs to s3 bucket"
    else:
        result = "Pull request is not merged"

    return {'statusCode': 200, 'body': json.dumps(result)}