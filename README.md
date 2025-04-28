# DevOps Home Task - CI/CD Pipeline

## Overview
This project demonstrates a complete CI/CD pipeline for a simple Python application, built and deployed automatically using Jenkins and Docker.

The key goals achieved:
- Infrastructure provisioning (simulated locally) via Docker.
- Jenkins setup and full pipeline configuration.
- CI/CD flow: Clone ➔ Build ➔ Test ➔ Deploy stages.
- Automation from code push to deployment.

---

## Technologies Used
- Python 3 (Flask application)
- Docker
- Jenkins (self-hosted in Docker)
- GitHub (Code Repository)
- (Optional) Terraform for AWS provisioning (future extension)

---

## Project Structure
```plaintext
/app                # Flask application code
/tests              # Pytest tests for the application
Dockerfile          # Dockerfile for building the app image
Jenkinsfile         # Jenkins pipeline configuration
infra/              # (Optional) Terraform infrastructure as code
