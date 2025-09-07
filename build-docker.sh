#!/bin/bash

# Check if Docker Hub username is provided
if [ -z "$1" ]
then
    echo "Please provide your Docker Hub username"
    echo "Usage: ./build-docker.sh YOUR_DOCKERHUB_USERNAME"
    exit 1
fi

DOCKER_USERNAME=$1
IMAGE_NAME="springboot-eks"
TAG="latest"

echo "Building and pushing Docker image for Spring Boot application..."
echo "Docker Hub Username: $DOCKER_USERNAME"
echo "Image Name: $IMAGE_NAME"
echo "Tag: $TAG"

# Build the Spring Boot application
echo "Building Spring Boot application..."
./mvnw clean package -DskipTests

# Check if Maven build was successful
if [ $? -ne 0 ]; then
    echo "Maven build failed! Exiting..."
    exit 1
fi

# Build Docker image
echo "Building Docker image..."
docker build -t $DOCKER_USERNAME/$IMAGE_NAME:$TAG .

# Check if Docker build was successful
if [ $? -ne 0 ]; then
    echo "Docker build failed! Exiting..."
    exit 1
fi

# Log in to Docker Hub
echo "Logging in to Docker Hub..."
docker login

# Check if login was successful
if [ $? -ne 0 ]; then
    echo "Docker Hub login failed! Exiting..."
    exit 1
fi

# Push the image to Docker Hub
echo "Pushing image to Docker Hub..."
docker push $DOCKER_USERNAME/$IMAGE_NAME:$TAG

# Check if push was successful
if [ $? -ne 0 ]; then
    echo "Failed to push image to Docker Hub! Exiting..."
    exit 1
fi

echo "Successfully built and pushed Docker image: $DOCKER_USERNAME/$IMAGE_NAME:$TAG"

# Optional: Run the container locally
read -p "Do you want to run the container locally? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Running container locally..."
    docker run -d -p 8080:8080 $DOCKER_USERNAME/$IMAGE_NAME:$TAG
    echo "Container is running on http://localhost:8080"
fi
