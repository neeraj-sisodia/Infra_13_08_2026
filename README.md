# ⚡ Azure Infrastructure & Landing Zone Registry 🚀

[![Terraform](https://img.shields.io/badge/Terraform-1.x-purple?logo=terraform)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-Provider%20v4.x-blue?logo=microsoftazure)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
[![IaC](https://img.shields.io/badge/Architecture-Modular-success)](#-reusable-modules)

Welcome to the **Azure Infrastructure & Landing Zone Registry**! 🌐  
This repository contains modular Infrastructure as Code (IaC) written in **Terraform** to manage Microsoft Azure resources consistently across multiple environments (`preprod` and `prod`).

---

## 📁 Repository Structure

```text
Infra_13_08_2026/
├── 🌍 environment/                # Environment-specific deployment configurations
│   ├── 🧪 preprod/                # Pre-production environment configuration
│   │   ├── 📄 main.tf             # Module invocations for preprod
│   │   ├── ⚙️ provider.tf         # AzureRM provider settings & subscription configuration
│   │   └── 🔑 terraform.tfvars    # Input parameter values for preprod
│   └── 🏭 prod/                   # Production environment configuration
│       ├── 📄 main.tf             # Module invocations for prod
│       ├── ⚙️ provider.tf         # AzureRM provider settings & subscription configuration
│       └── 🔑 terraform.tfvars    # Input parameter values for prod
│
├── 🧩 modules/                    # Reusable Terraform modules
│   ├── 📦 azurerm_resource_group/ # Azure Resource Group module
│   │   ├── 📄 main.tf             # Resource Group definitions with for_each
│   │   └── 📄 variable.tf         # Input variable definitions
│   └── 💾 azurerm_storage_account/# Azure Storage Account module
│       ├── 📄 main.tf             # Storage Account definitions with for_each
│       └── 📄 variable.tf         # Input variable definitions
│
├── 🛡️ .gitignore                  # Git ignore definitions for Terraform state & sensitive files
└── 📖 README.md                   # Repository documentation
```

---

## 🧩 Reusable Modules

### 1. 📦 `azurerm_resource_group`
Provisions Azure Resource Groups dynamically using `for_each` maps.

- 📍 **Location**: [`modules/azurerm_resource_group`](modules/azurerm_resource_group)
- 📝 **Input Variables**:
  - `resource_group`: Map of resource group objects containing `name` and `location`.

---

### 2. 💾 `azurerm_storage_account`
Provisions Azure Storage Accounts dynamically using `for_each` maps.

- 📍 **Location**: [`modules/azurerm_storage_account`](modules/azurerm_storage_account)
- 📝 **Input Variables**:
  - `storage_account`: Map of storage account objects containing `name`, `resource_group_name`, `location`, `account_tier`, and `account_replication_type`.

---

## 🌍 Environments

The infrastructure is split into distinct environments under the `environment/` directory:

| Environment 🏛️ | Directory 📂 | Target Use Case 🎯 | Status 🚦 |
| :--- | :--- | :--- | :--- |
| **Pre-production** 🧪 | `environment/preprod` | Staging, testing, and pre-release validation | 🟡 Active |
| **Production** 🏭 | `environment/prod` | Production landing zone workloads | 🟢 Active |

---

## 🚀 Quick Start & Deployment Guide

### 📋 Prerequisites
- 🛠️ **[Terraform CLI](https://www.terraform.io/downloads)** (v1.x or later)
- ☁️ **[Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)**
- 🔑 Active **Azure Subscription** with permissions (`Contributor` or `Owner`)

---

### 🛠️ Step-by-Step Instructions

#### 🔐 Step 1: Authenticate to Azure
Log in to your Azure account using Azure CLI:
```bash
az login
```
Set your active subscription:
```bash
az account set --subscription "<SUBSCRIPTION_ID>"
```

#### 📂 Step 2: Navigate to Target Environment
Choose your desired target environment:
```bash
# 🧪 For Pre-Production
cd environment/preprod

# 🏭 For Production
cd environment/prod
```

#### 🏗️ Step 3: Initialize Terraform
Initialize the Terraform working directory to download the required provider plugins:
```bash
terraform init
```

#### 🔍 Step 4: Review Execution Plan
Generate and inspect an execution plan before making any infrastructure changes:
```bash
terraform plan
```

#### 🚀 Step 5: Apply Infrastructure Changes
Apply the configuration to provision Azure resources:
```bash
terraform apply
```

#### 🧹 Step 6: Clean Up / Teardown (Optional)
To destroy resources provisioned in the selected environment:
```bash
terraform destroy
```

---

## 🔒 Security & Best Practices 🛡️

> [!IMPORTANT]
> **Secrets Management**: Never commit sensitive secrets or credentials into `terraform.tfvars`. Use Azure Key Vault or environment variables for secret injection.

- 🔐 **State Management**: Configure a remote backend (e.g., Azure Blob Storage with state locking) for team collaboration.
- 📌 **Provider Version Pinning**: Provider configurations pin the `azurerm` provider version (`~> 4.0`) for stability and predictability.
- 🔁 **DRY Principles**: Utilize dynamic object maps (`for_each`) to keep module declarations clean and maintainable.

---

<p align="center">
  Made with ❤️ by DevOps Insiders | Happy Automating! 🚀
</p>