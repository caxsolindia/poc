AKS Deployment with Persistent Volumes and Azure Container Registry
Overview
This project sets up an Azure Kubernetes Service (AKS) cluster using Terraform and deploys multiple database services (Neo4j, MongoDB, MySQL) with Persistent Volumes for data storage. Additionally, container images are managed through Azure Container Registry (ACR).

Architecture
The architecture consists of the following key components:

User Interaction:

Users access the system via the AKS cluster.
Requests are handled by the NGINX Ingress controller.
Azure Kubernetes Service (AKS):

Hosts all containerized workloads.
Runs the application and database services.
Databases:

Neo4j, MongoDB, and MySQL are deployed inside AKS.
Each database has a dedicated Persistent Volume (PV) for data storage.
Persistent Volumes (PVs):

Each database gets a persistent volume to ensure data is not lost when containers restart.
Volumes are dynamically provisioned and managed within AKS.
Azure Container Registry (ACR):

Stores container images used for deployment.
AKS pulls images from ACR to deploy applications.
Ingress Controller (NGINX):

Manages incoming requests and routes traffic to the correct services.
Supports TLS termination for secure HTTPS connections.
Helm for Deployment:

Uses Helm charts to deploy and manage applications in AKS.
Helm values define configurations like replica count, service type, and ingress rules.
Infrastructure Components
1. Dockerfile
Defines a multi-stage build process:

Stage 1: Uses a Node.js (Alpine) image for building the application.
Stage 2: Uses NGINX for serving the built static files.
2. Helm Chart (values-dev.yaml)
Specifies replicas, container image, ports, and ingress configurations.
Uses ClusterIP service type for internal access.
Enables scaling and deployment management.
3. NGINX Configuration
Configures request routing.
Implements fallback rules to ensure correct resolution of frontend resources.
4. Ingress Configuration
Uses NGINX Ingress Controller.
Defines routes for multiple backend services.
Enables TLS encryption using Let's Encrypt.
Deployment Process
Build and Push Docker Image

Build the Docker image.
Push it to Azure Container Registry (ACR).
Deploy Helm Chart

Configure Helm values (values-dev.yaml).
Deploy using Helm.
Ingress Setup

Deploy the Ingress configuration.
Validate DNS and TLS certificate setup.