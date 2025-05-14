# Terraform & AWS CLI Installation Guide

This guide provides step-by-step instructions for installing Terraform and AWS CLI on different operating systems (macOS, Windows, and Linux). Follow the instructions specific to your operating system to set up your development environment for working with Terraform and AWS.

## Table of Contents
- [Prerequisites](#prerequisites)
- [macOS Installation](#macos-installation)
  - [Installing Terraform on macOS](#installing-terraform-on-macos)
  - [Installing VS Code and Terraform Plugin](#installing-vs-code-and-terraform-plugin)
  - [Installing AWS CLI on macOS](#installing-aws-cli-on-macos)
  - [Configuring AWS Credentials on macOS](#configuring-aws-credentials-on-macos)
- [Windows Installation](#windows-installation)
  - [Installing Terraform on Windows](#installing-terraform-on-windows)
  - [Installing Terraform using Chocolatey](#installing-terraform-using-chocolatey)
  - [Installing AWS CLI on Windows](#installing-aws-cli-on-windows)
- [Linux Installation](#linux-installation)
  - [Installing Terraform on Ubuntu](#installing-terraform-on-ubuntu)
  - [Installing Terraform on RHEL](#installing-terraform-on-rhel)
  - [Installing AWS CLI on Linux](#installing-aws-cli-on-linux)
- [Troubleshooting](#troubleshooting)

## Prerequisites

Before you begin, ensure you have the following:

- Administrator/sudo access to your system
- Internet connection
- AWS Account (required for AWS CLI configuration)

## macOS Installation

### Installing Terraform on macOS

1. Download the latest Terraform package from the [official Terraform website](https://developer.hashicorp.com/terraform/downloads)

2. Create an installation directory:
   ```bash
   mkdir /Users/<YOUR-USER>/Documents/terraform-install
   ```

3. Move the downloaded package to the installation directory and unzip it:
   ```bash
   cd /Users/<YOUR-USER>/Documents/terraform-install
   unzip terraform_*.zip
   ```

4. Move the Terraform binary to a directory in your PATH:
   ```bash
   mv terraform /usr/local/bin
   ```

5. Verify the installation:
   ```bash
   terraform version
   ```

**Note:** To uninstall Terraform (if needed), run:
```bash
rm -rf /usr/local/bin/terraform
```

### Installing VS Code and Terraform Plugin

1. Download and install [Microsoft Visual Studio Code](https://code.visualstudio.com/download)

2. Open VS Code and install the [HashiCorp Terraform Plugin](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform) from the Extensions marketplace

### Installing AWS CLI on macOS

1. Download and install the AWS CLI package:
   ```bash
   curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
   sudo installer -pkg AWSCLIV2.pkg -target /
   ```

2. Verify the installation:
   ```bash
   which aws
   aws --version
   ```

**Note:** To uninstall AWS CLI (if needed), run:
```bash
sudo rm /usr/local/bin/aws
sudo rm /usr/local/bin/aws_completer
sudo rm -rf /usr/local/aws-cli
```

### Configuring AWS Credentials on macOS

1. Generate security credentials from the AWS Management Console:
   - Go to AWS Management Console → IAM → Users → "Your-Admin-User" → Security Credentials → Create Access Key

2. Configure AWS credentials using the terminal:
   ```bash
   aws configure
   ```

3. Enter your credentials when prompted:
   ```
   AWS Access Key ID: [Enter your access key]
   AWS Secret Access Key: [Enter your secret key]
   Default region name: [Enter your preferred region, e.g., us-west-2]
   Default output format: [Enter your preferred format, e.g., json]
   ```

4. Verify your configuration:
   ```bash
   aws s3 ls
   cat $HOME/.aws/credentials
   ```

**Troubleshooting:** If you experience credentials errors, reset your AWS credentials with:
```bash
for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_SECURITY_TOKEN ; do eval unset $var ; done
```

## Windows Installation

### Installing Terraform on Windows

1. Download the latest Terraform ZIP file for Windows from the [official Terraform website](https://developer.hashicorp.com/terraform/downloads)

2. Create a new folder named "binaries" on your system

3. Extract the ZIP file and copy `terraform.exe` to the "binaries" folder

4. Add the "binaries" folder to your system PATH:
   - Search for "System" in the Control Panel
   - Click "Advanced system settings"
   - Click "Environment Variables"
   - Under "System Variables", select "PATH" and click "Edit"
   - Click "New" and add the full path to your "binaries" folder
   - Click "OK" on all windows

5. Verify the installation by opening a new Command Prompt window and running:
   ```
   terraform version
   ```

### Installing Terraform using Chocolatey

Alternatively, if you have Chocolatey package manager installed, you can install Terraform using:

```
choco install terraform
```

### Installing AWS CLI on Windows

Download and install the AWS CLI from the [official AWS CLI website](https://aws.amazon.com/cli/)

## Linux Installation

### Installing Terraform on Ubuntu

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```

### Installing Terraform on RHEL

**Method 1: Using the binary**
```bash
sudo yum update -y
sudo yum install wget unzip -y
sudo wget https://releases.hashicorp.com/terraform/1.4.4/terraform_1.4.4_linux_amd64.zip
sudo unzip terraform_1.4.4_linux_amd64.zip -d /usr/local/bin
terraform -v
```

**Method 2: Using HashiCorp repository**
```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```

### Installing AWS CLI on Linux

```bash
sudo yum update -y
sudo yum install curl unzip wget -y  
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

## Troubleshooting

- If you encounter issues with AWS credentials, try resetting them using the command provided in the macOS section
- For path-related issues, verify that the installation directories are correctly added to your system PATH
- For the latest installation instructions, always refer to the official documentation:
  - [Terraform Documentation](https://developer.hashicorp.com/terraform/downloads)
  - [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
