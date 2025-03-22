# **Task 9: Troubleshooting, Monitoring & Advanced Debugging**

## **1. Troubleshooting**

### **Simulating a Pipeline Failure**
To demonstrate troubleshooting, I introduced an intentional syntax error in the Jenkinsfile:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'exit 1' // Force pipeline failure
            }
        }
    }
}
```

### **Troubleshooting Process**
1. **Review Jenkins Console Output:**
   - Navigate to **Jenkins Dashboard → Build → Console Output**.
   - Identify the error message (`exit 1` caused intentional failure).

2. **Check Jenkins Logs:**
   - If running Jenkins in Docker:
     ```sh
     docker logs jenkins_container_name --tail 100
     ```
   - If running as a service:
     ```sh
     sudo journalctl -u jenkins -n 100 --no-pager
     ```
   - Look for permission errors, missing dependencies, or network failures.

3. **Investigate Agent Issues:**
   - Check if the agent is running:
     ```sh
     jenkins-cli list-nodes
     ```
   - Verify agent logs using:
     ```sh
     docker logs agent_container_name
     ```

4. **Validate Credentials & Secrets:**
   - If the failure is due to authentication (e.g., Docker login, Git credentials):
   - Check **Manage Jenkins → Credentials** for correctness.
   - Run manual authentication tests outside Jenkins.

## **2. Monitoring Jenkins**

### **Built-in Monitoring Methods**
- **Jenkins System Logs:**
  - Access via **Manage Jenkins → System Log**.
  - Use `tail -f /var/log/jenkins/jenkins.log` for live logs.

- **Build History & Trends:**
  - Use **Jenkins Dashboard → Build History** to detect recurring failures.

- **Thread Dump Analysis:**
  - If Jenkins is unresponsive:
    ```sh
    jstack <jenkins_process_id>
    ```

### **Monitoring Plugins**
- **Monitoring Plugin:** Provides performance graphs for CPU, memory, and threads.
- **Prometheus Plugin:** Exports Jenkins metrics for external monitoring tools.
- **New Relic / Datadog / Grafana:** Third-party monitoring for advanced insights.

## **3. Advanced Debugging**

### **Adding Debugging Statements in Jenkinsfile**

To capture key environment variables and intermediate results:

```groovy
pipeline {
    agent any
    stages {
        stage('Debugging') {
            steps {
                echo "Current Workspace: ${env.WORKSPACE}"
                sh 'printenv | sort'
            }
        }
    }
}
```

### **Using Jenkins 'Replay' Feature**
- After a failure, go to the **Pipeline Build → Replay**.
- Modify the script in the UI and test without committing.
- Helps validate quick fixes before updating the repository.

### **Enabling Verbose Logging**
If a specific step is failing, increase verbosity:
```groovy
sh 'mvn clean install -X'  // Enables debug mode in Maven
sh 'docker build . --progress=plain'  // Debug Docker build issues
```

## **4. Reflections & Best Practices**

- **Early Error Detection:** Adding `set -e` in shell scripts prevents unnoticed failures.
- **Centralized Monitoring:** Integrating Jenkins with Prometheus and Grafana provides deeper insights.
- **Efficient Debugging:** The Replay feature accelerates testing fixes without additional commits.
- **Regular Log Audits:** Reviewing Jenkins logs proactively reduces unexpected failures.

By implementing these strategies, we can maintain a stable and efficient CI/CD environment in Jenkins. 🚀

