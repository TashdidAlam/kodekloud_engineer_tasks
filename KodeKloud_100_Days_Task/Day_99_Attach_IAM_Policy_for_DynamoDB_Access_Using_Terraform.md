# Question
The DevOps team has been tasked with creating a secure DynamoDB table and enforcing fine-grained access control using IAM. This setup will allow secure and restricted access to the table from trusted AWS services only.

As a member of the Nautilus DevOps Team, your task is to perform the following using Terraform:

Create a DynamoDB Table: Create a table named nautilus-table with minimal configuration.

Create an IAM Role: Create an IAM role named nautilus-role that will be allowed to access the table.

Create an IAM Policy: Create a policy named nautilus-readonly-policy that should grant read-only access (GetItem, Scan, Query) to the specific DynamoDB table and attach it to the role.

Create the main.tf file (do not create a separate .tf file) to provision the table, role, and policy.

Create the variables.tf file with the following variables:

KKE_TABLE_NAME: name of the DynamoDB table
KKE_ROLE_NAME: name of the IAM role
KKE_POLICY_NAME: name of the IAM policy
Create the outputs.tf file with the following outputs:

kke_dynamodb_table: name of the DynamoDB table
kke_iam_role_name: name of the IAM role
kke_iam_policy_name: name of the IAM policy
Define the actual values for these variables in the terraform.tfvars file.

Ensure that the IAM policy allows only read access and restricts it to the specific DynamoDB table created.


Notes:

The Terraform working directory is /home/bob/terraform.

Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

Before submitting the task, ensure that terraform plan returns No changes. Your infrastructure matches the configuration.

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
# -------------------------
# DynamoDB TABLE
# -------------------------
resource "aws_dynamodb_table" "nautilus_table" {
  name         = var.KKE_TABLE_NAME
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = var.KKE_TABLE_NAME
  }
}

# -------------------------
# IAM ROLE
# -------------------------
resource "aws_iam_role" "nautilus_role" {
  name = var.KKE_ROLE_NAME

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = var.KKE_ROLE_NAME
  }
}

# -------------------------
# IAM POLICY (Read-only to DynamoDB table)
# -------------------------
resource "aws_iam_policy" "nautilus_readonly_policy" {
  name        = var.KKE_POLICY_NAME
  description = "Read-only access to DynamoDB table"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ]
        Resource = aws_dynamodb_table.nautilus_table.arn
      }
    ]
  })

  tags = {
    Name = var.KKE_POLICY_NAME
  }
}

# -------------------------
# Attach policy to role
# -------------------------
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.nautilus_role.name
  policy_arn = aws_iam_policy.nautilus_readonly_policy.arn
}
```

- Add the following content to `variables.tf`:
```hcl
variable "KKE_TABLE_NAME" {
  type        = string
  description = "DynamoDB table name"
}

variable "KKE_ROLE_NAME" {
  type        = string
  description = "IAM role name"
}

variable "KKE_POLICY_NAME" {
  type        = string
  description = "IAM policy name"
}
```

- Add the following content to `outputs.tf`:
```hcl
output "kke_dynamodb_table" {
  value = aws_dynamodb_table.nautilus_table.name
}

output "kke_iam_role_name" {
  value = aws_iam_role.nautilus_role.name
}

output "kke_iam_policy_name" {
  value = aws_iam_policy.nautilus_readonly_policy.name
}
```

- Add the following content to `terraform.tfvars`:
```hcl
KKE_TABLE_NAME  = "nautilus-table"
KKE_ROLE_NAME   = "nautilus-role"
KKE_POLICY_NAME = "nautilus-readonly-policy"
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