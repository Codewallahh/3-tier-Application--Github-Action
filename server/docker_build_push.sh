#!/bin/bash

# Define variables
TAG=${TAG:-0}
IMAGE_NAME=ci-cd-mern-dc-frontend
REPOSITORY=tiwari123
FULL_TAG=${REPOSITORY}/${IMAGE_NAME}:v1.0.${TAG}

# Docker login
echo "Logging into Docker Hub..."
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

# Build the Docker image
echo "Building Docker image..."
docker build --platform linux/amd64 -t ${IMAGE_NAME}:v1.0.${TAG} .

# Tag and push the Docker image
echo "Pushing Docker image to Docker Hub..."
docker tag ${IMAGE_NAME}:v1.0.${TAG} ${FULL_TAG}
docker push ${FULL_TAG}

echo "Docker image pushed successfully: ${FULL_TAG}"
