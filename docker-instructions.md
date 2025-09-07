# Docker Setup Instructions for Spring Boot Application

This guide provides instructions for building, pushing, and running Docker images for the Spring Boot application.

## Prerequisites

- Docker installed on your system
- Docker Hub account
- Maven and Java 17 installed (for local testing)
- Access to the Spring Boot application source code

## Docker Image Build and Push Process

### 1. Dockerfile Structure
The project uses a multi-stage Dockerfile:
```dockerfile
# Build stage
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Runtime stage
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/springboot-eks.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
```

### 2. Manual Build and Push Process

1. Build the Docker image:
```bash
docker build -t YOUR_DOCKERHUB_USERNAME/springboot-eks:latest .
```

2. Log in to Docker Hub:
```bash
docker login
```

3. Push the image to Docker Hub:
```bash
docker push YOUR_DOCKERHUB_USERNAME/springboot-eks:latest
```

### 3. Using the Automated Script

1. Make the script executable:
```bash
chmod +x build-docker.sh
```

2. Run the script:
```bash
./build-docker.sh YOUR_DOCKERHUB_USERNAME
```

## Running the Docker Container

1. Pull the image (if not built locally):
```bash
docker pull YOUR_DOCKERHUB_USERNAME/springboot-eks:latest
```

2. Run the container:
```bash
docker run -p 8080:8080 YOUR_DOCKERHUB_USERNAME/springboot-eks:latest
```

3. Access the application:
- Open a web browser
- Navigate to `http://localhost:8080`

## Environment Variables (Optional)

You can pass environment variables to the container:
```bash
docker run -p 8080:8080 -e SPRING_PROFILES_ACTIVE=prod YOUR_DOCKERHUB_USERNAME/springboot-eks:latest
```

## Docker Container Management

1. List running containers:
```bash
docker ps
```

2. Stop a container:
```bash
docker stop CONTAINER_ID
```

3. Remove a container:
```bash
docker rm CONTAINER_ID
```

4. View container logs:
```bash
docker logs CONTAINER_ID
```

## Troubleshooting

1. If the build fails:
   - Ensure Docker daemon is running
   - Check Maven build success
   - Verify Dockerfile syntax

2. If push fails:
   - Verify Docker Hub credentials
   - Check internet connection
   - Ensure you have permissions to push

3. If container fails to start:
   - Check port availability
   - View logs using `docker logs`
   - Verify Java version compatibility

## Best Practices

1. Always tag your images with specific versions
2. Use multi-stage builds to minimize image size
3. Don't store sensitive data in the image
4. Regularly update base images
5. Use .dockerignore to exclude unnecessary files

## Version Information

- Base Image: openjdk:17-jdk-slim
- Spring Boot: Check pom.xml for version
- Docker: Latest version recommended
