# 🛡️ The Unbreakable App: DevOps End-to-End Automation

![CI Status](https://github.com/AdnSmile/devops-unbreakable-app/actions/workflows/ci.yml/badge.svg)

> **A comprehensive demonstration of the DevOps cycle: From basic Scripting, Containerization, IaC, to Kubernetes Orchestration.**

## 📖 About The Project
This project is more than just a simple Python application. It serves as a living laboratory where I implemented **"Automation First"** and **"Infrastructure as Code"** principles from the ground up.

The main goal was to build a system that is:
1.  **Portable:** Runs anywhere seamlessly (Docker).
2.  **Reliable:** Code is validated automatically before merging (CI).
3.  **Reproducible:** Infrastructure is provisioned via code, not manual clicks (Terraform/Ansible).
4.  **Unbreakable:** The application is self-healing (Kubernetes).

---

## 🚀 The Journey & Implementation (What I Did)

In this project, I acted as a DevOps Engineer building infrastructure from scratch. Here are the development phases:

### 🔹 Phase 1: Linux Automation (Bash Scripting)
Established the foundation for server automation.
- Developed `setup_server.sh` scripts for simulating server provisioning.
- Implemented **Logic Control** to prevent redundant installations (Basic Idempotency).
- Managed security via **Environment Variables** (`.env`) to avoid hardcoding database credentials.
- Implemented an automated logging system storing outputs in `logs/`.

### 🔹 Phase 2: Containerization (Docker)
Solved the *"It works on my machine"* dilemma.
- Packaged the Python Flask application and its dependencies using **Dockerfile** (Multi-stage build concept).
- Orchestrated the connection between the App and the Database (Redis) using **Docker Compose**.
- Ensured the application runs in an isolated environment with internal Docker networking.

### 🔹 Phase 3: Continuous Integration (GitHub Actions)
Deployed the "Automated Gatekeeper" to the repository.
- Configured the pipeline in `.github/workflows/ci.yml`.
- **Linting:** Automated checks for Python code quality (Flake8).
- **Build Test:** Automated validation to ensure the Docker Image builds successfully on every `git push`.

### 🔹 Phase 4: Infrastructure as Code (Terraform)
Moved away from manual server provisioning.
- Used **Terraform** to provision Docker infrastructure declaratively.
- Learned and applied **Immutable Infrastructure** concepts: changing configuration triggers a resource replacement rather than an in-place edit.
- Managed infrastructure state tracking via `terraform.tfstate`.

### 🔹 Phase 5: Configuration Management (Ansible)
Automated internal server configuration.
- Utilized **Ansible Playbooks** to setup the application environment inside target servers.
- Leveraged the `docker_container` connection plugin for agentless management (no SSH required for local docker).
- Injected dynamic configuration files containing server timestamps using Jinja2 templates.

### 🔹 Phase 6: Orchestration (Kubernetes/Minikube)
The final stage: High Availability & Self-Healing.
- Migrated from Docker Compose to **Kubernetes (K8s)**.
- Created **Deployments** for both the Python App and Redis.
- Implemented **Service Discovery** allowing the app to resolve the Redis database via internal Cluster DNS.
- **Self-Healing Test:** Verified that Kubernetes automatically resurrects Pods if they are forcibly terminated.

---

## 🛠 Tech Stack

| Category | Technology | Usage in Project |
| :--- | :--- | :--- |
| **Language** | Python (Flask) | REST API application with a Redis Visit Counter |
| **Scripting** | Bash | Local environment automation & setup |
| **Container** | Docker | Application packaging |
| **Orchestrator** | Kubernetes (Minikube) | Cluster management, scaling, and self-healing |
| **IaC** | Terraform | Container infrastructure provisioning |
| **Config Mgmt** | Ansible | Server configuration & file management |
| **CI/CD** | GitHub Actions | Automated Testing & Build Validation |

---

## ⚙️ How to Run

You can run this project in two modes:

### Mode 1: Docker Compose (Quick Start)
Use this for local development.
```bash
# Clone the repo
git clone [https://github.com/AdnSmile/devops-unbreakable-app.git](https://github.com/AdnSmile/devops-unbreakable-app.git)
cd devops-unbreakable-app

# Run services
docker-compose up --build
