# 🐳 Docker Commands Cheat Sheet

## 📌 **Basic Docker Commands**

### 🔹 Check Docker Version
```sh
docker --version
```

### 🔹 Pull an Image from Docker Hub
```sh
docker pull <image-name>
```
Example:
```sh
docker pull nginx
```

### 🔹 List Downloaded Images
```sh
docker images
```

### 🔹 Run a Container
```sh
docker run -d -p <host-port>:<container-port> --name <container-name> <image-name>
```
Example:
```sh
docker run -d -p 8080:80 --name my-nginx nginx
```

### 🔹 List Running Containers
```sh
docker ps
```

### 🔹 List All Containers (Including Stopped Ones)
```sh
docker ps -a
```

### 🔹 Stop a Running Container
```sh
docker stop <container-name or ID>
```
Example:
```sh
docker stop my-nginx
```

### 🔹 Remove a Container
```sh
docker rm <container-name or ID>
```

### 🔹 Remove an Image
```sh
docker rmi <image-name or ID>
```

### 🔹 View Container Logs
```sh
docker logs <container-name or ID>
```

### 🔹 Execute a Command Inside a Running Container
```sh
docker exec -it <container-name or ID> <command>
```
Example:
```sh
docker exec -it my-nginx /bin/bash
```

---

## 📌 **Intermediate Docker Commands**

### 🔹 Build a Docker Image
```sh
docker build -t <image-name> .
```

### 🔹 Tag an Image
```sh
docker tag <image-name>:<tag> <repository-name>:<tag>
```
Example:
```sh
docker tag my-app:latest myrepo/my-app:v1.0
```

### 🔹 Push an Image to Docker Hub
```sh
docker push <repository-name>:<tag>
```
Example:
```sh
docker push myrepo/my-app:v1.0
```

### 🔹 Pull an Image from Docker Hub
```sh
docker pull <repository-name>:<tag>
```

### 🔹 Save a Docker Image as a Tar File
```sh
docker save -o <filename>.tar <image-name>
```
Example:
```sh
docker save -o my-app.tar myrepo/my-app:v1.0
```

### 🔹 Load a Docker Image from a Tar File
```sh
docker load -i <filename>.tar
```

### 🔹 Inspect Container Details
```sh
docker inspect <container-name or ID>
```

### 🔹 Check Container Resource Usage
```sh
docker stats
```

### 🔹 Show Running Processes in a Container
```sh
docker top <container-name or ID>
```

---

## 📌 **Advanced Docker Commands**

### 🔹 Run a Container in Interactive Mode
```sh
docker run -it <image-name> /bin/bash
```

### 🔹 Start a Stopped Container
```sh
docker start <container-name or ID>
```

### 🔹 Restart a Container
```sh
docker restart <container-name or ID>
```

### 🔹 Pause & Unpause a Container
```sh
docker pause <container-name or ID>
docker unpause <container-name or ID>
```

### 🔹 Copy Files Between Host and Container
```sh
docker cp <container-name>:<container-path> <host-path>
```
Example:
```sh
docker cp my-container:/var/log/nginx/access.log ./access.log
```

### 🔹 Create a Docker Volume
```sh
docker volume create <volume-name>
```

### 🔹 List Docker Volumes
```sh
docker volume ls
```

### 🔹 Remove a Docker Volume
```sh
docker volume rm <volume-name>
```

---

## 📌 **Docker Compose Commands**

### 🔹 Start Services in Docker Compose
```sh
docker-compose up -d
```

### 🔹 Stop Services in Docker Compose
```sh
docker-compose down
```

### 🔹 View Logs for a Docker Compose Service
```sh
docker-compose logs -f <service-name>
```

### 🔹 Restart a Specific Service
```sh
docker-compose restart <service-name>
```

### 🔹 Build & Rebuild Images in Docker Compose
```sh
docker-compose build
```

---

## 📌 **Security & Docker Scout Commands**

### 🔹 Scan an Image for Vulnerabilities
```sh
docker scout quickview <image-name>
```

### 🔹 List CVEs for an Image
```sh
docker scout cves <image-name>
```

### 🔹 Get Security Recommendations
```sh
docker scout recommendations <image-name>
```

### 🔹 Compare Two Versions of an Image
```sh
docker scout compare <old-image> <new-image>
```

---

## 📌 **Clean Up Unused Docker Resources**

### 🔹 Remove All Stopped Containers
```sh
docker container prune
```

### 🔹 Remove All Unused Images
```sh
docker image prune -a
```

### 🔹 Remove Unused Docker Volumes
```sh
docker volume prune
```

### 🔹 Remove Unused Docker Networks
```sh
docker network prune
```

### 🔹 Remove All Unused Resources (Images, Containers, Networks, Volumes)
```sh
docker system prune -a
```

---



