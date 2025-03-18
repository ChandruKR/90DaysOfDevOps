## Task 3: Configure and Scale Jenkins Agents/Nodes


# README: Configuring and Scaling Jenkins Agents/Nodes

## Overview
This guide provides the steps to configure and scale Jenkins agents/nodes using multiple methods:
1. **Dynamic Docker Agents**
2. **Linux Virtual Machine (VM) Agent**
3. **Windows Agent**

These agents help distribute workload, improving performance and scalability in Jenkins CI/CD pipelines.

---


## AGENT setup PIPELINE Video Clip:
![AGENTS Demonstration, Download the video clip and watch](https://github.com/ChandruKR/90DaysOfDevOps/blob/Jenkins/Task_3/AGENTS_INSTALLATION_PROOFS.mp4)



## 1. Configuring Dynamic Docker Agents in Jenkins
### Steps Performed:
1. Installed **Docker Plugin** in Jenkins for seamless Docker integration.
2. Configured a Docker host within Jenkins by navigating to:
   - **Manage Jenkins** > **Manage Nodes and Clouds** > **Configure Clouds** > **Add a new cloud** > **Docker**.
3. Set up **Docker Agent Template**:
   - Defined labels for easy reference.
   - Specified the **Remote File System Root**.
   - Configured SSH credentials to allow Jenkins to connect to the Docker-based agent.
4. Created a Docker image with Ubuntu as the base OS.
5. Used a Dockerfile to install necessary dependencies (e.g., Java) and create a Jenkins user.
6. Built and tagged the image with `my-docker-agent`.
7. Pushed the image to a container registry (if required) or used it locally.
8. Verified dynamic agent provisioning by running a test job in Jenkins.

### Reference:
Refer to the `Dockerfile` in this repository for the exact setup steps.

---

## 2. Configuring a Linux Virtual Machine (VM) as a Jenkins Node
### Steps Performed:
1. Logged into Jenkins and navigated to:
   - **Manage Jenkins** > **Manage Nodes and Clouds** > **New Node**.
2. Created a new Linux node with a unique name.
3. Set the **Remote Root Directory** for Jenkins to use on the agent.
4. Selected **Launch Method: SSH**.
5. Provided SSH credentials for authentication.
6. Saved the configuration and allowed Jenkins to establish the connection.
7. Verified successful connection by checking node status in Jenkins.

---

## 3. Configuring a Windows Agent as a Jenkins Node
### Prerequisites:
- Install **Java** on the Windows machine.
- Set `JAVA_HOME` environment variable to the Java installation path.

### Steps Performed:
1. In Jenkins, navigated to:
   - **Manage Jenkins** > **Manage Nodes and Clouds** > **New Node**.
2. Created a new Windows node with a unique name.
3. Set the **Launch Method** to **Launch agent by connecting it to the controller**.
4. Used the following `CURL` command to download the `agent.jar` file inside `C:\Jenkins` folder on the Windows agent:
   ```sh
   curl -o C:\Jenkins\agent.jar http://108.129.128.##2:8080/jnlpJars/agent.jar
   ```
5. Executed the following command to register and connect the agent:
   ```sh
   java -jar C:\Jenkins\agent.jar -url http://108.129.128.112:8080/ -secret 3b4bfcff651f61d44df1ff31d6e2699aa23ff42ee7a594128328ae5391 -name "Windows-Agent" -webSocket -workDir "C:\Jenkins"
   ```
6. Verified the connection by checking node status in Jenkins.
7. Tested communication using the **Script Console** in Jenkins.

---

## Testing the Agent Connections
To validate agent connections, perform the following:
1. Navigate to **Manage Jenkins** > **Manage Nodes and Clouds**.
2. Check the status of each agent.
3. Run a test job on each agent to confirm proper functionality.

---

## Conclusion
Successfully configured three types of Jenkins agents:
- **Dynamic Docker Agents** for ephemeral, on-demand builds.
- **Linux Virtual Machine Agents** for persistent workloads.
- **Windows Agents** for Windows-specific builds.

This setup enhances Jenkins' scalability and efficiency by distributing workloads across different environments.

