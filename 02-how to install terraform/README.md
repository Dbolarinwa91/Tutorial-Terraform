# Terraform Installation Guide

This guide provides step-by-step instructions for installing Terraform on different operating systems (macOS, Windows, and Linux). Follow the instructions specific to your operating system to set up your development environment for working with Terraform.

## Table of Contents
- [Prerequisites](#prerequisites)
- [macOS Installation](#macos)
- [Windows Installation](#windows)
  - [Manual Installation](#windows-manual)
  - [Chocolatey Installation](#windows-chocolatey)
- [Linux Installation](#linux)
  - [Ubuntu Installation](#linux-ubuntu)
  - [RHEL Installation](#linux-rhel)
- [Verifying Installation](#verify)
- [Uninstalling Terraform](#uninstall)
- [Recommended Tools](#recommended-tools)
- [Troubleshooting](#troubleshooting)

## Prerequisites <a name="prerequisites"></a>

Before you begin, ensure you have the following:

- Administrator/sudo access to your system
- Internet connection

## macOS Installation <a name="macos"></a>

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

## Windows Installation <a name="windows"></a>

### Manual Installation <a name="windows-manual"></a>

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

### Chocolatey Installation <a name="windows-chocolatey"></a>

If you have Chocolatey package manager installed, you can install Terraform using:

```
choco install terraform
```

## Linux Installation <a name="linux"></a>

### Ubuntu Installation <a name="linux-ubuntu"></a>

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```

### RHEL Installation <a name="linux-rhel"></a>

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

## Verifying Installation <a name="verify"></a>

After installing Terraform, verify the installation by running:

```bash
terraform version
```

This command should display the version of Terraform that was installed.

## Uninstalling Terraform <a name="uninstall"></a>

### macOS
```bash
rm -rf /usr/local/bin/terraform
```

### Windows
- Remove the terraform.exe file from your "binaries" folder
- Or if installed with Chocolatey: `choco uninstall terraform`

### Linux (Ubuntu)
```bash
sudo apt-get remove terraform
```

### Linux (RHEL)
```bash
sudo yum remove terraform
```

## Recommended Tools <a name="recommended-tools"></a>

For a better development experience, we recommend installing:

1. [Microsoft Visual Studio Code](https://code.visualstudio.com/download)

2. [HashiCorp Terraform Plugin for VS Code](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)

## Troubleshooting <a name="troubleshooting"></a>

- If you get a "command not found" error, ensure Terraform is in your PATH
- For path-related issues, verify that the installation directories are correctly added to your system PATH
- For the latest installation instructions, always refer to the [official Terraform documentation](https://developer.hashicorp.com/terraform/downloads)
