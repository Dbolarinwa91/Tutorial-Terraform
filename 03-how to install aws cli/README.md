# README.md

```markdown
# Terraform & AWS CLI Installation Guide

This README provides comprehensive instructions for installing and configuring Terraform and AWS CLI on different operating systems. It's designed to be easy to follow, especially for first-time users.

## Table of Contents
- [Prerequisites](#prerequisites)
- [macOS Installation](#macos-installation)
  - [Terraform Installation on macOS](#terraform-installation-on-macos)
  - [AWS CLI Installation on macOS](#aws-cli-installation-on-macos)
  - [Configure AWS Credentials on macOS](#configure-aws-credentials-on-macos)
- [Windows Installation](#windows-installation)
  - [Terraform Installation on Windows](#terraform-installation-on-windows)
  - [AWS CLI Installation on Windows](#aws-cli-installation-on-windows)
- [Linux Installation](#linux-installation)
  - [Terraform Installation on Linux](#terraform-installation-on-linux)
  - [AWS CLI Installation on Linux](#aws-cli-installation-on-linux)
- [AWS CLI Additional Information](#aws-cli-additional-information)
  - [Verifying Installation](#verifying-installation)
  - [Troubleshooting](#troubleshooting)
- [Next Steps](#next-steps)

## Prerequisites

Before you begin, ensure you have the following:
- Administrative access to your computer
- An AWS account (for AWS CLI configuration)
- Internet connection for downloading the necessary packages

Recommended tools:
- VS Code Editor - [Download here](https://code.visualstudio.com/download)
- HashiCorp Terraform plugin for VS Code - [Get it here](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

## macOS Installation

### Terraform Installation on macOS

1. Download the Terraform package for macOS from the [official Terraform website](https://www.terraform.io/downloads.html)

2. Create an installation directory:
   ```bash
   mkdir /Users/<YOUR-USER>/Documents/terraform-install
   ```

3. Copy the downloaded package to the installation directory

4. Unzip the package:
   ```bash
   unzip terraform_*.zip
   ```

5. Move the Terraform binary to a directory in your PATH:
   ```bash
   mv terraform /usr/local/bin
   ```

6. Verify the installation:
   ```bash
   terraform version
   ```

### AWS CLI Installation on macOS

#### Option 1: GUI Installer (Recommended for beginners)

1. Download the macOS pkg file from: https://awscli.amazonaws.com/AWSCLIV2.pkg
2. Run the downloaded file and follow the on-screen instructions
3. The installer offers two installation options:
   - For all users (requires sudo)
   - For only the current user (doesn't require sudo)

#### Option 2: Command Line Installation

1. Download and run the installer:
   ```bash
   curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
   sudo installer -pkg AWSCLIV2.pkg -target /
   ```

2. Verify the installation:
   ```bash
   which aws
   aws --version
   ```

### Configure AWS Credentials on macOS

1. Generate Security Credentials:
   - Go to AWS Management Console → IAM → Users → "Your-Admin-User" → Security Credentials → Create Access Key

2. Configure AWS credentials in terminal:
   ```bash
   aws configure
   ```

3. Enter your credentials when prompted:
   ```
   AWS Access Key ID [None]: YOUR_ACCESS_KEY
   AWS Secret Access Key [None]: YOUR_SECRET_KEY
   Default region name [None]: your-region (e.g., us-west-2)
   Default output format [None]: json
   ```

4. Verify configuration:
   ```bash
   aws s3 ls
   cat $HOME/.aws/credentials
   ```

5. If you encounter credential errors, reset them with:
   ```bash
   for var in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_SECURITY_TOKEN ; do eval unset $var ; done
   ```

## Windows Installation

### Terraform Installation on Windows

#### Option 1: Manual Installation

1. Download Terraform for Windows from the [official website](https://www.terraform.io/downloads.html)
2. Create a new folder called `binaries`
3. Extract the ZIP file and copy `terraform.exe` to the binaries folder
4. Add the binaries folder to your PATH:
   - Search for "System" in Control Panel
   - Click "Advanced system settings"
   - Click "Environment Variables"
   - Under "System Variables," find "PATH" and click "Edit"
   - Click "New" and add the path to your binaries folder
   - Click "OK" on all dialog boxes

#### Option 2: Using Chocolatey Package Manager

1. Open PowerShell as Administrator
2. Run:
   ```powershell
   choco install terraform
   ```

### AWS CLI Installation on Windows

1. Download and run the AWS CLI MSI installer:
   - [AWS CLI MSI Installer for Windows (64-bit)](https://awscli.amazonaws.com/AWSCLIV2.msi)

2. Alternatively, install using command line:
   ```cmd
   msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
   ```

3. For silent installation:
   ```cmd
   msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi /qn
   ```

4. Verify installation:
   ```cmd
   aws --version
   ```

## Linux Installation

### Terraform Installation on Linux

#### For Ubuntu/Debian:

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```

#### For RHEL/CentOS/Amazon Linux:

**Option 1: Install from binary**
```bash
sudo yum update -y
sudo yum install wget unzip -y
sudo wget https://releases.hashicorp.com/terraform/1.4.4/terraform_1.4.4_linux_amd64.zip
sudo unzip terraform_1.4.4_linux_amd64.zip -d /usr/local/bin
terraform -v
```

**Option 2: Install from HashiCorp repository**
```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```

### AWS CLI Installation on Linux

**Warning**: If you're updating on Amazon Linux, first remove the pre-installed version:
```bash
sudo yum remove awscli
```

**Quick Installation**:
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

**Update Existing Installation**:
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
```

For detailed instructions including signature verification, see the [AWS CLI Additional Information](#aws-cli-additional-information) section.

## AWS CLI Additional Information

### Verifying Installation

After installation, verify AWS CLI is working properly:

```bash
aws --version
```

Expected output (version numbers may vary):
```
aws-cli/2.25.11 Python/3.11.6 Linux/5.10.205-195.807.amzn2.x86_64
```

### Troubleshooting

If you encounter issues after installing or uninstalling the AWS CLI, try these common solutions:

1. **Command not found errors**: 
   - Restart your terminal/command prompt
   - Verify your PATH environment variable includes the installation directory

2. **Version mismatch**:
   - Check if you have multiple installations in different locations
   - Use `which aws` (Linux/macOS) or `where aws` (Windows) to locate all installations

3. **AWS CLI remains after uninstall**:
   - You may have multiple installations
   - Follow the complete uninstallation steps for your OS

For more troubleshooting steps, visit the [official AWS CLI troubleshooting documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-troubleshooting.html).

## Next Steps

After successfully installing Terraform and AWS CLI:

1. Set up your AWS credentials if you haven't already
2. Try running basic commands to ensure everything works:
   ```bash
   terraform -help
   aws s3 ls
   ```
3. Start exploring Terraform configurations and AWS resources

For more information:
- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/)

---

*This README was last updated: May 2025*
```