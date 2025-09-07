# Question
The Nautilus DevOps team is strategizing the migration of a portion of their infrastructure to the AWS cloud. To achieve this, they are breaking down the migration into smaller, manageable tasks. For this task, you need to create a key pair using Terraform with the following requirements:

- Name of the key pair: `datacenter-kp`
- Key pair type: `rsa`
- The private key file should be saved under `/home/bob/datacenter-kp.pem`
- The Terraform working directory is `/home/bob/terraform`. Create the `main.tf` file (do not create a different .tf file) to accomplish this task.

<span style="color: red;">The below commands and actions are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: Open the terminal and navigate to the Terraform working directory**
- Open the integrated terminal in VS Code and confirm your working directory.
  ```
  pwd
  cd /home/bob/terraform
  ```
  > *Ensures you are in the correct directory to manage Terraform files and state.*

**Step 2: Create the main.tf file**
- Create the Terraform configuration file.
  ```
  touch main.tf
  ```
  > *Creates an empty file where you will define your Terraform resources.*

**Step 3: Write the Terraform configuration**
- Add the following content to `main.tf`:
  ```hcl
  resource "tls_private_key" "datacenter-kp" {
    algorithm = "RSA"
  }

  resource "local_file" "datacenter-kp" {
    content         = tls_private_key.datacenter-kp.private_key_pem
    filename        = "/home/bob/datacenter-kp.pem"
    file_permission = "0600"
  }

  resource "aws_key_pair" "datacenter-kp" {
    key_name   = "datacenter-kp"
    public_key = tls_private_key.datacenter-kp.public_key_openssh
  }
  ```
  > *Defines resources to generate an RSA key pair, save the private key locally, and create an AWS key pair using the public key.*

**Step 4: Initialize Terraform**
- Initialize the Terraform working directory.
  ```
  terraform init
  ```
  > *Downloads the required providers and prepares the directory for use with Terraform.*

**Step 5: Validate the Terraform configuration**
- Check the configuration for syntax errors.
  ```
  terraform validate
  ```
  > *Ensures your configuration is syntactically valid.*

**Step 6: Review the Terraform plan**
- See what actions Terraform will take.
  ```
  terraform plan
  ```
  > *Shows the resources that will be created, updated, or destroyed. You should see 3 to create, 0 to update, 0 to destroy.*

**Step 7: Apply the Terraform configuration**
- Create the resources as defined in your configuration.
  ```
  terraform apply -auto-approve
  ```
  > *Applies the configuration and creates the key pair and local file without prompting for approval.*

**Step 8: Verify the private key file**
- Check that the private key file was created.
  ```
  ls -la /home/bob
  ```
  > *Confirms that `datacenter-kp.pem` exists in the specified directory with correct permissions.*

**Step 9: Complete the task**
- Click on confirm to complete the task.

