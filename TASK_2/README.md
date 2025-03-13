# Multi-Branch Pipeline Project in Jenkins

## Overview
This project demonstrates how to configure and use a **Multi-Branch Pipeline** in Jenkins. The setup ensures that different branches are deployed with distinct configurations and triggers automated builds for new branches and pull requests.

## Multi-Branch Pipeline Project Video Clip:
![Project 2 Pipeline Demo, Download the video clip and watch](https://github.com/ChandruKR/90DaysOfDevOps/blob/Jenkins/Task_1/Project_2_REC.mp4)
## Steps Performed

1. **Created a new Multi-Branch Pipeline in Jenkins**.
2. **Configured three main branches**:
   - `Development` (Deployed on **port 3000**)
   - `Master` (Deployed on **Np PORT**)
   - `Production` (Deployed on **port 5000**)
3. **Implemented `when` conditions** to ensure stages execute only if the branch name matches the expected branch.
4. **Configured Jenkins to scan Git repositories for new branches**.
5. **Created a feature branch and simulated a pull request workflow**:
   - Used the **Jenkins Pipeline Multibranch Plugin** to auto-trigger builds on new PRs and branch creation.

## Git Repository
Find the source code and Jenkinsfile for this project at:
[Git Repository Link](https://github.com/ChandruKR/building-a-multibranch-pipeline-project.git) 

## Interview Questions and Answers

### 1. How does a multi-branch pipeline improve continuous integration for microservices?
A **Multi-Branch Pipeline** enables efficient **continuous integration (CI)** for microservices by:
- **Automating builds and tests** for each branch, ensuring isolated testing environments.
- **Triggering builds automatically** on branch creation or pull requests, reducing manual interventions.
- **Allowing branch-specific configurations**, ensuring microservices can be tested and deployed under different environments.
- **Improving developer collaboration**, as each feature or bug fix can be validated independently before merging.

### 2. What challenges might you face when merging feature branches in a multi-branch pipeline?
Some potential challenges include:
- **Merge Conflicts**: Changes from multiple branches may cause conflicts that need manual resolution.
- **Environment Differences**: If different branches have distinct configurations, merging could introduce inconsistencies.
- **Stale Feature Branches**: Feature branches that are not updated frequently with the latest changes from the main branch may introduce outdated dependencies or vulnerabilities.
- **Testing Overhead**: Running tests on multiple branches simultaneously can increase resource consumption.

## Conclusion
This setup ensures a robust **CI/CD workflow** using Jenkins Multi-Branch Pipelines, automating deployments and maintaining branch-specific configurations effectively.

