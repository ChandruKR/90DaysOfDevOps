  # 🐳 Docker Terminologies & Components

Docker is a powerful platform for developing, shipping, and running applications in containers. This guide provides an overview of key **Docker terminologies** and **components** to help you understand and work with Docker effectively.

---

## 📌 1. Docker Terminologies  

### 🔹 Image  
- A lightweight, stand-alone, and executable package containing application code, dependencies, libraries, and runtime environment.  
- Built using a **Dockerfile** and stored in **Docker Hub** or a private registry.  
- Immutable and used to create containers.  

### 🔹 Container  
- A running instance of a Docker image.  
- Encapsulates an application and its dependencies in a lightweight, portable environment.  
- Containers are isolated from the host system but share the OS kernel.  

### 🔹 Dockerfile  
- A script containing a set of instructions for building a Docker image.  
- Specifies the base image, application dependencies, environment variables, and commands to run.  

### 🔹 Volume  
- A method for persisting data in Docker.  
- Helps store data outside the container lifecycle, preventing data loss when a container is removed.  

### 🔹 Docker Compose  
- A tool used to define and run multi-container Docker applications.  
- Uses a `docker-compose.yml` file to define services, networks, and volumes.  

### 🔹 Registry  
- A storage location for Docker images.  
- Examples: **Docker Hub**, **Amazon ECR**, **Google Container Registry**, and private registries.  

### 🔹 Network  
- Enables communication between Docker containers and the external world.  
- Types:
  - **Bridge** (default) - Containers on the same bridge network can communicate.
  - **Host** - Uses the host's network.
  - **Overlay** - Used in Swarm mode.
  - **None** - No networking.  

### 🔹 Swarm  
- Docker’s native clustering tool for managing multiple Docker hosts.  
- Allows scaling and orchestration of containerized applications.  

---

## ⚙️ 2. Docker Components  

### 🔹 Docker Engine  
- The core component responsible for building, running, and managing containers.  
- Comprises:
  - **Docker Daemon (`dockerd`)** - Runs in the background and manages Docker objects.
  - **REST API** - Allows communication with the daemon.
  - **Docker CLI** - Command-line tool to interact with Docker.  

### 🔹 Docker Hub  
- A cloud-based registry where Docker images are stored and shared.  
- Provides official images and user-contributed images.  

### 🔹 Docker CLI  
- Command-line interface to interact with Docker.  
- Common commands:
  ```sh
  docker run <image_name>      # Start a container
  docker build -t <tag_name> . # Create an image from a Dockerfile
  docker ps                    # List running containers
  docker stop <container_id>    # Stop a running container
  docker logs <container_id>    # View logs of a container
