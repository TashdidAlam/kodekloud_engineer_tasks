# Question
When establishing infrastructure on the AWS cloud, Identity and Access Management (IAM) is among the first and most critical services to configure. IAM facilitates the creation and management of user accounts, groups, roles, policies, and other access controls. The Nautilus DevOps team is currently in the process of configuring these resources and has outlined the following requirements. 

Create an IAM policy named iampolicy_ammar in us-east-1 region using Terraform. It must allow read-only access to the EC2 console, i.e., this policy must allow users to view all instances, AMIs, and snapshots in the Amazon EC2 console. 

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
    resource "aws_iam_policy" "iampolicy_ammar" {
    name        = "iampolicy_ammar"
    description = "Read-only access to EC2 console"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect   = "Allow"
            Action   = [
            "ec2:Describe*"
            ]
            Resource = "*"
        }
        ]
    })
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