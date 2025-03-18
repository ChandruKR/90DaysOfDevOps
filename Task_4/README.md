## Task 4: Implement and Test RBAC in a Multi-Team Environment

In Jenkins, the **Role-Based Authorization Strategy** plugin allows fine-grained access control by defining roles and assigning them to users or groups. There are three main types of roles: **Global Roles, Item Roles, and Agent Roles**.  

---

## ROLE BASED Access COntrol DEMO CLIP:
![ROLE BASED Access COntrol DEMO CLIP](https://github.com/ChandruKR/90DaysOfDevOps/blob/Jenkins/Task_4/ROLE_Based_Access_Control_DEMO.mp4)


### 1. **Global Roles**  
These roles apply to **all of Jenkins** and control high-level permissions.  

#### **Common Permissions in Global Roles:**  
- `Admin`: Full control over Jenkins (configure system, manage jobs, security, etc.).  
- `Read-only`: Can view Jenkins but cannot make changes.  
- `Developer`: Can create and manage jobs but cannot configure Jenkins itself.  
- `Viewer`: Can only see the jobs and builds but cannot trigger them.  

---

### 2. **Item Roles**  
These roles apply to **specific jobs (projects, pipelines, or folders)** in Jenkins. You can use patterns (e.g., `project-*`) to assign roles to groups of jobs.  

#### **Common Permissions in Item Roles:**  
- `Job Read`: Allows viewing jobs.  
- `Job Build`: Allows triggering builds.  
- `Job Configure`: Allows modifying job configurations.  
- `Job Delete`: Allows deleting jobs.  

For example, a **Developer** might have full access to jobs they create, while a **Tester** may only have build permissions.  

---

### 3. **Agent Roles**  
These roles control permissions on **Jenkins agents (nodes)**, which execute jobs.  

#### **Common Permissions in Agent Roles:**  
- `Agent Connect`: Allows connecting agents to Jenkins.  
- `Agent Configure`: Allows modifying agent settings.  
- `Agent Build`: Allows jobs to be executed on specific agents.  
- `Agent Disconnect`: Allows stopping an agent.  

For example, a **DevOps Engineer** might have full access to all agents, while a **Developer** might only be allowed to run builds on a specific agent.  

---

### **Example Scenario:**  
- **Admin** (Global Role): Can manage everything.  
- **Developer** (Item Role: `project-*`): Can create and manage jobs starting with `project-`.  
- **Tester** (Item Role: `test-*`): Can only run jobs related to testing.  
- **Build Agent Role** (Agent Role: `linux-agent`): Developers can run builds on a specific agent but cannot configure it.  

### **1. Why is RBAC essential in a CI/CD environment, and what are the consequences of weak access control?**  

#### **Importance of RBAC in CI/CD:**  
Role-Based Access Control (RBAC) is critical in a CI/CD environment for:  
- **Security**: Prevents unauthorized access to sensitive configurations, credentials, and infrastructure.  
- **Least Privilege Principle**: Ensures users have only the permissions required for their role, reducing risk.  
- **Compliance & Auditing**: Helps enforce security policies and meet regulatory requirements (e.g., SOC 2, GDPR).  
- **Operational Stability**: Prevents accidental changes to production pipelines and infrastructure.  
- **Separation of Duties**: Enforces access control between developers, testers, and DevOps teams to minimize risks.  

#### **Consequences of Weak Access Control:**  
- **Unauthorized Code Changes**: If a developer has admin access, they could modify or delete critical jobs.  
- **Pipeline Hijacking**: Attackers could inject malicious code into a pipeline and deploy it to production.  
- **Credential Leakage**: Misconfigured RBAC may allow unauthorized users to access stored secrets (e.g., API keys, database passwords).  
- **Data Breaches**: Unauthorized access to build artifacts or logs could expose sensitive information.  
- **Service Disruption**: Improper access may allow unintended modifications, causing deployment failures.  

---

### **2. Can you describe a scenario where inadequate RBAC could lead to security issues?**  

#### **Scenario: Unauthorized Job Modification in Jenkins**  
**Setup:**  
- A CI/CD pipeline deploys a Java application using Jenkins.  
- Developers have full access to all jobs, including production deployment pipelines.  

**Issue:**  
- A developer accidentally or maliciously modifies a production deployment job to deploy an untested feature branch instead of the stable release.  
- The untested code gets deployed, causing application failure in production.  

**Impact:**  
- **Downtime**: Customers experience outages due to an unstable release.  
- **Security Risks**: A malicious insider could introduce backdoors or security vulnerabilities.  
- **Reputation Damage**: If a security breach occurs, it could lead to loss of customer trust.  

**Solution:**  
- Implement **RBAC**: Restrict production deployment access to DevOps engineers.  
- Use **Approval Gates**: Require approvals before deploying to production.  
- Enable **Audit Logging**: Track who modified pipelines and jobs.  
