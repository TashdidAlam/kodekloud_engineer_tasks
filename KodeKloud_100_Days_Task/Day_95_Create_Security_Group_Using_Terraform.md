# Question
The Nautilus DevOps team is strategizing the migration of a portion of their infrastructure to the AWS cloud. Recognizing the scale of this undertaking, they have opted to approach the migration in incremental steps rather than as a single massive transition. To achieve this, they have segmented large tasks into smaller, more manageable units. This granular approach enables the team to execute the migration in gradual phases, ensuring smoother implementation and minimizing disruption to ongoing operations. By breaking down the migration into smaller tasks, the Nautilus DevOps team can systematically progress through each stage, allowing for better control, risk mitigation, and optimization of resources throughout the migration process.

Use Terraform to create a security group under the default VPC with the following requirements:

1) The name of the security group must be devops-sg.

2) The description must be Security group for Nautilus App Servers.

3) Add an inbound rule of type HTTP, with a port range of 80, and source CIDR range 0.0.0.0/0.

4) Add another inbound rule of type SSH, with a port range of 22, and source CIDR range 0.0.0.0/0.

Ensure that the security group is created in the us-east-1 region using Terraform. The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

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
# Fetch the default VPC
data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "devops_sg" {
  name        = "devops-sg"
  description = "Security group for Nautilus App Servers"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
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