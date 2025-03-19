## Task 7: Dynamic Pipeline Parameterization


# Mega Jenkins CI/CD Pipeline Project

## Overview
This project implements a **Mega Jenkins Pipeline** using a **parameterized CI/CD pipeline** that dynamically selects deployment agents, application types, and versions. The pipeline supports two different environments and applications:

- **Two-Tier Flask-MySQL Application** (Deployed on a Linux VM Agent)
- **Java-Maven Web Application** (Built and Deployed in a Docker Container)

## Features Implemented

### 1. **Dynamic Pipeline Parameterization**
- Users can select:
  - **Target Environment:** `TEst` (Linux VM Agent) or `Docker-Jenkins-Agent` (Docker Agent)
  - **Application Type:** `Maven_Web_App` or `Flask_MySQL_App`
  - **Application Version:** Custom versioning for builds
- The selected parameters dynamically determine the pipeline execution path.

### 2. **Agent Selection**
- The pipeline dynamically assigns an agent based on `TARGET_ENV`.
- The **Maven Web App** is built and deployed in a **Docker Container**.
- The **Flask-MySQL App** is deployed in a **Linux VM**.

### 3. **Code Checkout**
- GitHub repositories are cloned based on the selected `BUILD_TYPE`:
  - **Maven Web App:** [Java-mvn-app2](https://github.com/ChandruKR/Java-mvn-app2.git)
  - **Flask-MySQL App:** [Two-Tier Flask App](https://github.com/ChandruKR/two-tier-flask-app.git)
- `stash` is used to transfer workspace files between stages (for Maven builds only).

### 4. **Trivy Security Scanning**
- **File System Scan:** Runs `trivy fs .` to scan for vulnerabilities in workspace files.
- **Docker Image Scanning:** Ensures that built images are free of vulnerabilities before deployment.

### 5. **Application Build Process**
- **Maven Web App:**
  - Restores the stashed workspace.
  - Uses **Maven** to build the application (`mvn clean package`).
  - Stashes the `target` folder for deployment.
- **Flask-MySQL App:**
  - Built using **Docker Compose** (`docker build -t local_flask-app:latest .`).

### 6. **Docker Image Management**
- **Tagging & Pushing to Docker Hub:**
  - The Flask application’s Docker image is tagged and pushed to **Docker Hub** securely using stored Jenkins credentials.
  - Uses `docker login` and `docker push` commands for secure authentication.

### 7. **Application Deployment**
- **Maven Web App:**
  - Unstashes the built artifacts.
  - Deploys the `.war` file to an **Apache Tomcat** server.
  - Starts the Tomcat server (`/opt/tomcat/bin/startup.sh`).
- **Flask-MySQL App:**
  - Uses **Docker Compose** (`docker-compose up -d`) for deployment.

### 8. **Declarative Post Actions (Email Notifications)**
- **Success Notification:** Sends an email with build details (`BUILD_URL`).
- **Failure Notification:**
  - Sends email to **DevelopersRecipientProvider** and a predefined recipient.
  - Includes build failure logs and workspace path.

## Technologies Used
- **Jenkins** for CI/CD automation
- **Groovy Pipeline** scripting
- **Maven** for Java builds
- **Docker & Docker Compose** for containerization
- **Trivy** for security scanning
- **SonarQube** for code quality checks
- **GitHub** for version control
- **Tomcat Server** for Java application hosting

## Lessons Learned
- **Dynamic Agent Selection:** How to configure multi-agent pipelines based on user-selected parameters.
- **Stash & Unstash:** Works only within the **same agent and workspace**; if workspace changes, the stash is lost.
- **Trivy Scanning:** Used for both **file system** and **Docker image security checks**.
- **Docker Image Management:** Securely handling authentication with Docker Hub credentials in Jenkins.
- **Deployment Automation:** Automating **Tomcat** deployment and **Docker-Compose** for Flask applications.
- **Docker Agent Not Spawning in Time:**
If the agent Docker-Jenkins-Agent is dynamically created, Jenkins might be waiting for the container to start. Try increasing the connection timeout:

## Conclusion
This Jenkins pipeline provides a **fully automated, dynamic CI/CD process** that supports different environments, applications, and deployment strategies. It ensures **security, flexibility, and efficiency** in software delivery.

---
🚀 **Next Steps:**
- Implement **Kubernetes Deployment** for better scalability.
- Integrate **Terraform** for infrastructure automation.
- Improve **Logging & Monitoring** using ELK Stack or Prometheus-Grafana.

