# DevOps Project

## Overview
This project is a DevOps pipeline implementation for deploying a Flask application. The pipeline uses GitHub Actions for CI/CD, Docker for containerization, Google Kubernetes Engine (GKE) for orchestration, Terraform for infrastructure management, Helm for deployment.

## Architecture
The architecture consists of the following components:
- **Flask App**: A simple Flask application packaged into a Docker container.
- **CI/CD Pipeline**: GitHub Actions for automated builds, tests, and deployment.
- **Docker**: Containerization of the Flask application.
- **GKE**: Google Kubernetes Engine for container orchestration.
- **Terraform**: Used to provision infrastructure on Google Cloud.
- **Helm**: For deploying the Flask app to Kubernetes.
- **Prometheus/Grafana**: Optional monitoring tools for tracking the performance of the app.

## Steps
1. **CI Pipeline**: 
   - Code is pushed to the `main` branch.
   - GitHub Actions builds and tests the Flask application.
   - A Docker image is built and pushed to Docker Hub.

2. **CD Pipeline**: 
   - Once the Docker image is pushed, the CD pipeline is triggered.
   - The pipeline deploys the Flask app to GKE using Terraform and Helm.

3. **Monitoring**: 
   - Prometheus collects metrics from the Flask app.
   - Grafana is used to visualize the metrics and monitor the health of the app.

## Technologies
- **GitHub Actions** for CI/CD
- **Docker** for containerization
- **Google Cloud (GKE)** for orchestration
- **Terraform** for infrastructure provisioning
- **Helm** for Kubernetes deployment
- **Prometheus/Grafana** for monitoring

## Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/devops-project.git
   cd devops-project
