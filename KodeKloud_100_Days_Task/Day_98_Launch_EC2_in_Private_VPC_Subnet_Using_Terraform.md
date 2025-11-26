# Question
The Nautilus DevOps team is expanding their AWS infrastructure and requires the setup of a private Virtual Private Cloud (VPC) along with a subnet. This VPC and subnet configuration will ensure that resources deployed within them remain isolated from external networks and can only communicate within the VPC. Additionally, the team needs to provision an EC2 instance under the newly created private VPC. This instance should be accessible only from within the VPC, allowing for secure communication and resource management within the AWS environment. 
Create a VPC named xfusion-priv-vpc with the CIDR block 10.0.0.0/16. 

Create a subnet named xfusion-priv-subnet inside the VPC with the CIDR block 10.0.1.0/24 and auto-assign IP option must not be enabled. 

Create an EC2 instance named xfusion-priv-ec2 inside the subnet and instance type must be t2.micro. 

Ensure the security group of the EC2 instance allows access only from within the VPC's CIDR block. 

Create the main.tf file (do not create a separate .tf file) to provision the VPC, subnet and EC2 instance. 

Use variables.tf file with the following variable names: 
KKE_VPC_CIDR for the VPC CIDR block. 
KKE_SUBNET_CIDR for the subnet CIDR block. 

Use the outputs.tf file with the following variable names: 
KKE_vpc_name for the name of the VPC. 
KKE_subnet_name for the name of the subnet. 
KKE_ec2_private for the name of the EC2 instance. 

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
resource "aws_vpc" "xfusion_priv_vpc" {
  cidr_block = var.KKE_VPC_CIDR

  tags = {
    Name = "xfusion-priv-vpc"
  }
}

resource "aws_subnet" "xfusion_priv_subnet" {
  vpc_id                  = aws_vpc.xfusion_priv_vpc.id
  cidr_block              = var.KKE_SUBNET_CIDR
  map_public_ip_on_launch = false   # Auto-assign IP disabled

  tags = {
    Name = "xfusion-priv-subnet"
  }
}

resource "aws_security_group" "xfusion_priv_sg" {
  name        = "xfusion-priv-sg"
  description = "Allow internal VPC traffic only"
  vpc_id      = aws_vpc.xfusion_priv_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.KKE_VPC_CIDR]
  }

  tags = {
    Name = "xfusion-priv-sg"
  }
}

resource "aws_instance" "xfusion_priv_ec2" {
  ami           = "ami-0c101f26f147fa7fd" # Amazon Linux 2
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.xfusion_priv_subnet.id
  vpc_security_group_ids = [aws_security_group.xfusion_priv_sg.id]

  tags = {
    Name = "xfusion-priv-ec2"
  }
}

```

- Add the following content to `variables.tf`:
```
variable "KKE_VPC_CIDR" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "KKE_SUBNET_CIDR" {
  description = "CIDR block for the Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

```

- Add the following content to `outputs.tf`:
```
output "KKE_vpc_name" {
  value = aws_vpc.xfusion_priv_vpc.tags["Name"]
}

output "KKE_subnet_name" {
  value = aws_subnet.xfusion_priv_subnet.tags["Name"]
}

output "KKE_ec2_private" {
  value = aws_instance.xfusion_priv_ec2.tags["Name"]
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