# 🚀 Elevate Pro – CI/CD Pipeline with GitHub Actions, Docker & Terraform (Azure)

## 📌 Project Overview
This project demonstrates a complete CI/CD pipeline implementation for a sample Python web application.  
The pipeline automates the process of building, testing, containerizing, and deploying the application on Azure using GitHub Actions, Docker, and Terraform.

## 🛠️ Tech Stack
- **Language:** Python 3.12  
- **CI/CD:** GitHub Actions  
- **Containerization:** Docker & DockerHub  
- **Infrastructure as Code:** Terraform  
- **Cloud Provider:** Microsoft Azure  
- **Monitoring & Logging:** Azure Monitor & Log Analytics  

## ⚙️ Pipeline Workflow
### Continuous Integration (CI)
- Triggered on push or pull request to `main`.  
- Runs linting (flake8, black, isort).  
- Runs unit tests (pytest).  
- Builds Docker image and pushes it to DockerHub.  

### Continuous Deployment (CD)
- Triggered after CI passes.  
- Uses Terraform to provision Azure infrastructure.  
- Deploys the containerized application to Azure.  
- Provides a public URL to access the app.  

## 📂 Repository Structure
.
├── app/ # Python application code
├── tests/ # Unit tests
├── azure-terraform/ # Terraform IaC definitions
├── .github/workflows/ # CI/CD workflow files
│ ├── ci.yml # CI pipeline
│ └── cd.yml # CD pipeline
├── Dockerfile # Docker image definition
├── docker-compose.yml # Local setup (optional)
├── requirements.txt # App dependencies
├── requirements-dev.txt # Dev/test dependencies
└── README.md # Project documentation


## 🚀 Getting Started
### Local Development

git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install -r requirements-dev.txt
pytest -q

Docker Build & Run

docker build -t <your-dockerhub-username>/elevate-pro-cicd:latest .
docker run -p 8000:8000 <your-dockerhub-username>/elevate-pro-cicd:latest

App will be available at http://localhost:8000

🌐 Deployment on Azure
Deployment is fully automated via GitHub Actions and Terraform.
Push changes to the main branch.
GitHub Actions pipeline will:
Run CI checks
Build & push Docker image to DockerHub
Apply Terraform to provision Azure infra
Deploy the app and output a public URL
Final result: Application accessible on Azure with a public endpoint.

🔒 Security
GitHub Secrets are used for sensitive values (DockerHub, Azure credentials).
Terraform state can be stored securely in remote backends (Azure Storage recommended).
Azure RBAC is applied for least-privilege access.

✨ Key Learnings
Implementing end-to-end CI/CD with GitHub Actions.
Managing infrastructure using Terraform.
Deploying containerized apps on Azure.
Integrating testing, monitoring, and security into DevOps pipelines.

👨‍💻 Author: Rajeswara Rao
📅 Year: 2025
