#!/bin/bash
VALIDATE_DOCKER_INSTALL=true
USE_EXISTING_DOCKER_INSTALL=false

# Check if docker is already installed
if ! command -v docker &> /dev/null
then
    echo "Docker not found..."
    install_docker
else
    echo "Docker is already installed..."
    if [ "$USE_EXISTING_DOCKER_INSTALL" = !true ]; then
        echo "Please remove any previous Docker installations before running this script."
        exit 1
    fi
fi

# Create Portainer container
echo "Creating Portainer container..."
docker volume create portainer_data
docker run -d \
    --name=portainer \
    --restart=always \
    -p 8000:8000 \
    -p 9000:9000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:lts
d
# Create Minecraft container
echo "Creating Minecraft container..."
docker run -d \
    --name=minecraft-bedrock-server \
    --restart=always \
    -p 25565:25565 \
    -e EULA=TRUE \
    -v /opt/minecraft-server:/data \
    itzg/minecraft-server:latest

# Docker
install_docker() {
    echo "Installing Docker..."

    # Add Docker's official GPG key
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get 

    # Install Docker
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Validate Docker installation
    if [ "$VALIDATE_DOCKER_INSTALL" = true ]; then
        if ! sudo docker run hello-world &> /dev/null
        then
            echo "Docker installation failed, please check the logs."
            exit 1
        else
            echo "Docker installed successfully."
            docker rm -f hello-world
        fi
    fi
}