#!/bin/bash
set -e
REGION=ap-south-1
ACCOUNT=897722694404
REPO=my-docker-app


# Login to ECR
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com


# Pull and run
docker pull ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${REPO}:latest
docker run -d --restart always -p 80:80 --name my-docker-app ${ACCOUNT}.dkr.ecr.${REGION}.amazonaws.com/${REPO}:latest
