# Question
The Nautilus DevOps team is strategizing the migration of a portion of their infrastructure to the AWS cloud. Recognizing the scale of this undertaking, they have opted to approach the migration in incremental steps rather than as a single massive transition. To achieve this, they have segmented large tasks into smaller, more manageable units. This granular approach enables the team to execute the migration in gradual phases, ensuring smoother implementation and minimizing disruption to ongoing operations. By breaking down the migration into smaller tasks, the Nautilus DevOps team can systematically progress through each stage, allowing for better control, risk mitigation, and optimization of resources throughout the migration process.

Create a VPC named datacenter-vpc in region us-east-1 with any IPv4 CIDR block through terraform.

The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

## Steps

**Step 1: Create the main.tf file**
- Create the Terraform configuration file.
  ```
  touch main.tf
  ```
  > *Creates an empty file where you will define your Terraform resources.*

**Step 2: Write the Terraform configuration**
- Add the following content to `main.tf`:
  ```hcl
resource "aws_vpc" "datacenter-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "datacenter-vpc"
  }
}
  ```

**Step 3: Initialize Terraform**
- Initialize the Terraform working directory.
  ```
  terraform init
  ```
  > *Downloads the required providers and prepares the directory for use with Terraform.*

**Step 4: Validate the Terraform configuration**
- Check the configuration for syntax errors.
  ```
  terraform validate
  ```
  > *Ensures your configuration is syntactically valid.*

**Step 5: Review the Terraform plan**
- See what actions Terraform will take.
  ```
  terraform plan
  ```
  > *Shows the resources that will be created, updated, or destroyed. You should see 3 to create, 0 to update, 0 to destroy.*

**Step 6: Apply the Terraform configuration**
- Create the resources as defined in your configuration.
  ```
  terraform apply -auto-approve
  ```
  > *Applies the configuration and creates the key pair and local file without prompting for approval.*

**Step 7: Complete the task**
- Click on confirm to complete the task.