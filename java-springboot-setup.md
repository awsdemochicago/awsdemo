# Java 17 and Spring Boot Setup Guide

This guide provides instructions for setting up Java 17 and running Spring Boot applications.

## Prerequisites

- Ubuntu/Debian-based system
- Sudo privileges
- Basic terminal knowledge

## Java 17 Installation and Setup

1. First, make the setup script executable:
   ```bash
   chmod +x setup-java17.sh
   ```

2. Run the setup script:
   ```bash
   ./setup-java17.sh
   ```

3. Verify Java installation:
   ```bash
   java -version
   ```
   You should see output indicating Java 17 is installed:
   ```
   openjdk version "17.x.x"
   OpenJDK Runtime Environment
   OpenJDK 64-Bit Server VM
   ```

## Manual Setup (if script fails)

If you need to set up Java 17 manually, follow these steps:

1. Update package list:
   ```bash
   sudo apt-get update
   ```

2. Install OpenJDK 17:
   ```bash
   sudo apt-get install -y openjdk-17-jdk
   ```

3. Set environment variables:
   ```bash
   export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
   export PATH=$JAVA_HOME/bin:$PATH
   ```

4. Make environment variables permanent:
   ```bash
   echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> ~/.bashrc
   echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
   source ~/.bashrc
   ```

## Running Spring Boot Application

1. Make Maven wrapper executable:
   ```bash
   chmod +x mvnw
   ```

2. Build the application:
   ```bash
   ./mvnw clean install
   ```

3. Run the application:
   ```bash
   ./mvnw spring-boot:run
   ```

## Troubleshooting

1. If you see "Permission denied" when running scripts:
   ```bash
   chmod +x script_name.sh
   ```

2. If Java version is incorrect, verify JAVA_HOME:
   ```bash
   echo $JAVA_HOME
   java -version
   ```

3. If Maven fails to build, ensure Java 17 is active:
   ```bash
   export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
   export PATH=$JAVA_HOME/bin:$PATH
   ```

## Additional Notes

- The application may take a few moments to start
- Default port is usually 8080
- Check application.properties for configuration settings
- Logs will be displayed in the terminal

## Version Information

- Java: OpenJDK 17
- Spring Boot: Check pom.xml for exact version
- Maven: Uses Maven Wrapper (./mvnw)

Remember to always check your pom.xml for the correct Java version configuration and Spring Boot dependencies.
