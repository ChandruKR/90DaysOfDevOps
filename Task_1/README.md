## Task 1: Create a Jenkins Pipeline Job for CI/CD

# CI/CD Pipeline Setup with Jenkins
![Pipeline Demo](https://github.com/ChandruKR/90DaysOfDevOps/blob/Jenkins/Task_1/13.03.2025_05.22.46_REC.mp4)

https://github.com/user-attachments/assets/4e370a2e-b2a8-4836-8e90-b61030de7674

## Prerequisites
Ensure the following tools and services are installed and configured:
- **Jenkins** (latest version)
- **Required Jenkins Plugins:**
  - Maven Integration Plugin
  - SonarQube Scanner Plugin
  - SSH Publisher Plugin
  - Trivy Security Scanner Plugin
- **Docker & Docker Compose**
- **SonarQube Server**
- **GitHub Repository Access**
- **Docker Hub Account** (with a configured Personal Access Token in Jenkins credentials)
- **Agent Virtual Machine** for deployments

---
## Project Video Clip:


## 1. Java-based Web Application Pipeline
### Overview
This pipeline automates the build, test, and deployment of a Java web application using Jenkins.

### Pipeline Stages
1. **SCM Checkout** - Pulls source code from GitHub.
2. **Compile & Test** - Uses Maven to compile and run unit tests.
3. **SonarQube Analysis** - Performs static code analysis for security vulnerabilities.
4. **Build WAR File** - Generates a `.war` artifact.
5. **Deploy to Test Server** - Uses SSH Publisher to deploy the WAR file on the agent VM.
6. **Post-Build Actions** - Sends an email notification.

### Configuration Steps
1. Install required plugins in Jenkins.
2. Configure SonarQube in **Manage Jenkins > Configure System**.
3. Set up Maven in **Jenkins Global Tool Configuration**.
4. Add SSH credentials for the agent VM in Jenkins.
5. Define the `Jenkinsfile` for pipeline execution.

---

## 2. Two-Tier JavaScript Application Pipeline
### Overview
This pipeline automates the build and deployment of a JavaScript-based application using Docker.

### Pipeline Stages
1. **SCM Checkout** - Clones the GitHub repository.
2. **Trivy Security Scan** - Scans the file system for vulnerabilities.
3. **Build Docker Images** - Creates application and MySQL container images.
4. **Push to Docker Hub** - Tags and pushes built images.
5. **Deploy via Docker Compose** - Deploys the containers on the agent VM.
6. **Post-Build Actions** - Sends email notifications.

### Configuration Steps
1. Install **Docker and Docker Compose** on the agent VM.
2. Configure **Docker Hub credentials** in Jenkins (*Manage Credentials > Add Secret Text with PAT*).
3. Set up **Trivy security scanner**.
4. Create a `docker-compose.yml` for container orchestration.
5. Define the `Jenkinsfile` for pipeline execution.

---

## Running the Pipelines
1. Navigate to Jenkins and trigger the respective pipeline job.
2. Monitor the console logs for execution status.
3. Use `docker ps` on the agent VM to verify running containers.
4. Check email notifications for build results.

## Troubleshooting
- **SonarQube Analysis Fails?** Ensure the SonarQube server is running and Jenkins is configured correctly.
- **Docker Push to Hub Fails?** Verify the correct PAT is used in Jenkins credentials.
- **Deployment Issues?** Check SSH connection and permissions for the agent VM.
- **Trivy Security Scan Errors?** Ensure Trivy is correctly installed and configured.

---

## Conclusion
This CI/CD pipeline ensures automated builds, security scanning, and deployments for both applications. Contributions and improvements are welcome!

---

### Author
[Your Name]


