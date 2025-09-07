#!/bin/bash
# setup-java17.sh
# This script sets up Java 17 as the default JDK in your environment.

# Install OpenJDK 17 if not already installed
sudo apt update
sudo apt install -y openjdk-17-jdk

# Set JAVA_HOME and update PATH
JAVA_HOME_PATH="/usr/lib/jvm/java-17-openjdk-amd64"

if ! grep -q "JAVA_HOME" ~/.bashrc; then
    echo "export JAVA_HOME=$JAVA_HOME_PATH" >> ~/.bashrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
fi

# Apply changes to current session
export JAVA_HOME=$JAVA_HOME_PATH
export PATH=$JAVA_HOME/bin:$PATH

echo "Java version set to:"
java -version
echo "Javac version:"
javac -version
