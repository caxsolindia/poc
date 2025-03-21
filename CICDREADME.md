# CI/CD Pipeline for Azure Repos Git

## Overview
This document outlines the automated CI/CD pipeline process for Azure Repos Git. The pipeline ensures code quality, builds, tests, and deploys applications efficiently across different environments using Azure services.

## Data Flow

### PR Pipeline
A pull request (PR) to Azure Repos Git triggers the PR pipeline, executing the following steps:

1. **Code Quality Checks:**
   - Static code analysis via SonarCloud
   - Build validation
   - Unit test execution
   - Code coverage verification
   - Artifact publishing
2. **Merge Conditions:**
   - If any check fails, the PR is blocked from merging.
   - A successful run enables PR merging.

### CI Pipeline
A successful merge into the main repository triggers the CI pipeline, performing:

1. **PR Pipeline Tasks:** All validations from the PR pipeline are repeated.
2. **Containerization:**
   - A validated build generates a container image.
   - The image is published to Azure Container Registry (ACR).

### CD Pipeline
Upon successful completion of the CI pipeline, the CD pipeline is triggered automatically.

#### Deployment Workflow
The CD pipeline deploys a YAML-based configuration to the designated Azure Kubernetes Service (AKS) environment based on the branch:

- **Develop Branch →** AKS Dev Namespace
- **QA Branch →** AKS QA Namespace
- **Prod Branch →** AKS Prod Namespace

**Deployment Steps:**

1. **Image Pull:** The latest container image from ACR is pulled.
2. **Deployment Execution:** The YAML template is applied to the appropriate AKS environment.
3. **Acceptance Testing:** Automated tests validate the deployment.

## Environment-Specific Deployment Matrix

| Branch  | Deployment Target |
|---------|-------------------|
| Develop | AKS Dev Namespace |
| QA      | AKS QA Namespace  |
| Prod    | AKS Prod Namespace |

## Summary

- **PR Pipeline:** Ensures quality before merging code.
- **CI Pipeline:** Builds, tests, and publishes container images.
- **CD Pipeline:** Deploys applications seamlessly to AKS environments.

