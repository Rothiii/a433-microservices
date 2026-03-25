#!/bin/bash

# Config nya disini
USERNAME="rothiii"
IMAGE_NAME="item-app"
IMAGE_TAG="v1"
GHCR_IMAGE="ghcr.io/$USERNAME/a433-microservices/$IMAGE_NAME:$IMAGE_TAG"

# Build docker image dari Dockerfile yang udah dibuat
echo "1. Build Docker image"
docker build -t $IMAGE_NAME:$IMAGE_TAG .

# List local images untuk memastikan image sudah terbuild
echo "2. List local images"
docker images

# Tag image ke format GHCR
echo "3. Tag image ke GHCR format"
docker tag $IMAGE_NAME:$IMAGE_TAG $GHCR_IMAGE

# Input GitHub Token untuk login ke Github Packages
echo "4. Input GitHub Token"
read -s -p "Enter GitHub Token: " GITHUB_TOKEN
echo

# Login ke Github Packages menggunakan token
echo "5. Login ke Github Packages"
echo $GITHUB_TOKEN | docker login ghcr.io -u $USERNAME --password-stdin

# Push image ke Github Packages (GHCR)
echo "6. Push ke Github Packages (GHCR)"
docker push $GHCR_IMAGE

echo "Done: $GHCR_IMAGE"