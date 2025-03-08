# Infrastructure as Code (IaC) Project

This project contains configurations and workflows for managing infrastructure using code. It includes security checks and auto-remediation for Azure Kubernetes Service (AKS).

## Overview

- **Azure Kubernetes Security & Auto-Remediation**: A GitHub Actions workflow that performs security checks on AKS clusters and triggers auto-remediation for policy compliance.

## Setup

1. **Clone the repository**:
    ```sh
    git clone https://github.com/yourusername/iac.git
    cd iac
    ```

2. **Configure Secrets**:
    - Add `AZURE_CREDENTIALS` to your GitHub repository secrets.
    - Add `AZURE_SUBSCRIPTION_ID` to your GitHub repository secrets.

## Usage

The GitHub Actions workflow is triggered on push and pull request events to the `main` branch. It performs the following steps:

1. **Checkout Code**: Checks out the repository code.
2. **Login to Azure**: Authenticates to Azure using the provided credentials.
3. **Run kube-bench for CIS Compliance**: Runs kube-bench to check for CIS compliance.
4. **Run kubesec for YAML Security**: Scans Kubernetes YAML files for security issues.
5. **Check Azure Security Center Alerts**: Lists security alerts from Azure Security Center.
6. **Trigger Auto-Remediation**: Creates a remediation task for non-compliant AKS clusters.

For more details, refer to the [workflow file](.github/workflows/azure_security.yml).

## Contributing

Feel free to open issues or submit pull requests for any improvements or bug fixes.

## License

This project is licensed under the MIT License.
