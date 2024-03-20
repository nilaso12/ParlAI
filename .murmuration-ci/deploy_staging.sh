#!/bin/bash

Variable:
AWS_ACCESS_KEY_ID: 'AAAAB3NzaC1yc2EAAAADAQABAAABgQDDXt9ggEwtVxQP8MJe'
AWS_SECRET_ACCESS_KEY: 'jrI6sAaVrguCyU242CYyI33TAUPWEYRx6E6xfH/k35lUxmw86fjRUIKbii96qAEHaL'


# Define AWS S3 bucket name for staging deployment
S3_BUCKET="DeployStaging_bucket"

# Ensure AWS CLI is configured with appropriate credentials and region
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region us-east-1

# Sync the built website to the S3 bucket
aws s3 sync website/build/ s3://$S3_BUCKET --delete


# Print success message
echo "Staging deployment completed successfully."
