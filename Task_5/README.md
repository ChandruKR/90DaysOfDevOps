# **Task 5: Develop and Integrate a Jenkins Shared Library**

## **1. Creating a Shared Library Repository**
To centralize common Jenkins pipeline functions, we set up a separate **Git repository** for the Shared Library.

### **Repository Structure**
```
jenkins-shared-library/
├── vars/
│   ├── notify.groovy          # Notification function
│   ├── qualityCheck.groovy    # Code quality check function
│   ├── deployApp.groovy       # Deployment function
├── src/
│   └── org/company/           # (Optional) Additional classes
├── resources/                 # (Optional) Static resources
└── README.md
```

### **Example Shared Library Functions**
#### **1. Notification Function (notify.groovy)**
```groovy
// vars/notify.groovy
void call(String status) {
    if (status == 'SUCCESS') {
        echo "✅ Build succeeded!"
    } else {
        echo "❌ Build failed!"
    }
}
```

#### **2. Code Quality Check (qualityCheck.groovy)**
```groovy
// vars/qualityCheck.groovy
void call() {
    stage('Code Quality Check') {
        steps {
            echo 'Running SonarQube analysis...'
            sh 'mvn sonar:sonar'
        }
    }
}
```

#### **3. Deployment Function (deployApp.groovy)**
```groovy
// vars/deployApp.groovy
void call(String environment) {
    stage("Deploy to ${environment}") {
        steps {
            echo "Deploying application to ${environment}..."
            sh "kubectl apply -f deployment-${environment}.yaml"
        }
    }
}
```

---

## **2. Integrating the Shared Library in Jenkins Pipelines**

### **1. Configuring Jenkins to Use the Shared Library**
1. **Go to Jenkins Dashboard → Manage Jenkins → Configure System**
2. **Scroll to ‘Global Pipeline Libraries’**
3. **Add a new library:**
   - **Library Name:** `my-shared-library`
   - **Default Version:** `main` (or use a specific branch/tag)
   - **Retrieval Method:** Git
   - **Repository URL:** `https://github.com/your-org/jenkins-shared-library.git`

### **2. Using the Shared Library in a Jenkinsfile**

```groovy
@Library('my-shared-library') _

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'mvn clean install'
            }
        }
        stage('Code Quality') {
            steps {
                qualityCheck()
            }
        }
        stage('Deployment') {
            steps {
                deployApp('staging')
            }
        }
    }
    post {
        success {
            notify('SUCCESS')
        }
        failure {
            notify('FAILURE')
        }
    }
}
```

---

## **3. Benefits of Using a Shared Library**

### **How Shared Libraries Improve Maintainability & Reduce Errors**
- ✅ **Code Reusability:** Common functions (e.g., notifications, deployments) are centralized, reducing duplication.
- ✅ **Consistency:** Ensures that all projects follow standardized CI/CD processes.
- ✅ **Easier Maintenance:** Fixes and improvements are applied to all pipelines automatically.
- ✅ **Faster Development:** Developers can focus on project-specific logic instead of writing repetitive steps.

---

## **Interview Questions & Answers**

### **1. How do shared libraries contribute to code reuse and maintainability in large organizations?**
**Answer:** Shared libraries allow teams to define reusable pipeline functions that standardize CI/CD processes. Instead of duplicating logic across multiple pipelines, teams can maintain a single source of truth for build, test, and deployment procedures. This approach reduces technical debt, simplifies updates, and ensures consistency across projects.

### **2. Provide an example of a function that would be ideal for a shared library and explain its benefits.**
**Example Function: Slack Notifications**

```groovy
// vars/slackNotify.groovy
void call(String message) {
    sh "curl -X POST -H 'Content-type: application/json' --data '{"text":"${message}"}' https://hooks.slack.com/services/YOUR/SLACK/WEBHOOK"
}
```

**Benefits:**
- Ensures all teams use a **consistent** Slack notification format.
- Reduces redundant code across multiple pipelines.
- Centralized updates allow modifying the Slack channel or formatting without changing individual pipelines.

---

By implementing a Jenkins Shared Library, we achieve a **modular, scalable, and maintainable** CI/CD pipeline infrastructure! 🚀

