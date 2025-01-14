# CloudScapeAutomationInfrastructure

![Image Alt](https://github.com/Srinjana12/CloudScapeAutomationInfrastructure/blob/0f2a2c01624ec81cc4ed1ad82d4471fe2b828750/cloud%20infrastructure.jpg)

## Project Overview
The **CloudScape Infrastructure Automation** project was designed to automate and optimize backend operations using modern cloud technologies and Infrastructure as Code (IaC). This project focuses on developing scalable, secure, and efficient infrastructure solutions using AWS services, Flask, Terraform, and CI/CD pipelines.

---

## Features and Implementations

### 1. **Backend Development and API Integration**
- Developed and deployed **RESTful APIs** using Flask.
- Integrated AWS services:
  - **S3** for secure image storage.
  - **CloudWatch** for metrics and logging, ensuring efficient backend monitoring and operations.

### 2. **CI/CD Pipeline Automation**
- Automated testing, packaging, and deployment processes using **GitHub Actions**.
- Leveraged **Packer** to create custom Amazon Machine Images (AMIs) pre-configured with Flask application services.

### 3. **AWS Infrastructure Provisioning**
- Provisioned the following AWS resources using **Terraform modules**:
  - **VPCs** (Virtual Private Clouds).
  - **RDS** (Relational Database Service).
  - **S3 Buckets**.
  - **Load Balancers**.
- Ensured seamless integration with **Auto Scaling Groups** to maintain high availability and reliability.

### 4. **Secure Application Workflows**
- Implemented:
  - **KMS-encrypted S3 buckets** for secure data storage.
  - IAM role-based access policies.
  - **Security Groups** to ensure compliance and protect sensitive data.

### 5. **Domain Configuration and HTTPS Enablement**
- Configured domain management using **Route 53**.
- Integrated **SSL certificates** via AWS ACM (AWS Certificate Manager) to enable secure HTTPS communication through Application Load Balancers.

### 6. **Email Verification System**
- Architected an **email verification system** using:
  - **AWS SNS (Simple Notification Service)**.
  - **AWS Lambda** for automated user registration workflows with verification links.

### 7. **Streamlined Deployment Processes**
- Automated integration of custom AMIs and Auto Scaling Group updates using:
  - **GitHub Actions**.
  - **AWS CLI** for consistent and reliable infrastructure management.

---

## Technologies Used

### Programming Languages and Frameworks
- **Python** (Flask)

### Cloud Services
- **AWS Services:** S3, CloudWatch, Route 53, ACM, RDS, SNS, Lambda, Auto Scaling Groups
- **Packer** for AMI creation

### Infrastructure as Code (IaC)
- **Terraform**

### CI/CD Tools
- **GitHub Actions**
- **AWS CLI**

---

## Installation and Setup

### Prerequisites
1. **AWS CLI** installed and configured with necessary credentials.
2. **Terraform** installed on your local machine.
3. **Packer** installed for AMI creation.
4. **GitHub** repository cloned locally.
5. Python environment set up with Flask and required dependencies.

### Steps
1. **Clone the Repository**
   ```bash
   git clone <repository_url>
   cd <repository_folder>
   ```

2. **Set Up Terraform**
   - Navigate to the Terraform directory.
   - Initialize Terraform:
     ```bash
     terraform init
     ```
   - Apply Terraform configuration:
     ```bash
     terraform apply
     ```

3. **Build Custom AMIs with Packer**
   - Navigate to the Packer configuration directory.
   - Build the AMI:
     ```bash
     packer build aws.pkr.hcl
     ```

4. **Deploy the Application**
   - Use GitHub Actions to trigger the CI/CD pipeline for deployment.

---

## Usage
- Access the deployed application using the configured **Route 53 domain**.
- Use the RESTful API endpoints for application functionalities (e.g., image uploads, user registration).

---

## Contribution Guidelines
1. Fork the repository.
2. Create a new branch for your feature.
3. Commit your changes and submit a pull request.

---

