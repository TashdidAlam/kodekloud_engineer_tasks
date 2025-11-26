# Question
The Nautilus DevOps team has been tasked with setting up an EC2 instance for their application. To ensure the application performs optimally, they also need to create a CloudWatch alarm to monitor the instance's CPU utilization. The alarm should trigger if the CPU utilization exceeds 90% for one consecutive 5-minute period. To send notifications, use the SNS topic named datacenter-sns-topic, which is already created.

Launch EC2 Instance: Create an EC2 instance named datacenter-ec2 using any appropriate Ubuntu AMI (you can use AMI ami-0c02fb55956c7d316).

Create CloudWatch Alarm: Create a CloudWatch alarm named datacenter-alarm with the following specifications:

Statistic: Average
Metric: CPU Utilization
Threshold: >= 90% for 1 consecutive 5-minute period
Alarm Actions: Send a notification to the datacenter-sns-topic SNS topic.
Update the main.tf file (do not create a separate .tf file) to create a EC2 Instance and CloudWatch Alarm.

Create an outputs.tf file to output the following values:

KKE_instance_name for the EC2 instance name.
KKE_alarm_name for the CloudWatch alarm name.

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
# Existing SNS topic
resource "aws_sns_topic" "sns_topic" {
  name = "datacenter-sns-topic"
}

# -------------------------
# EC2 Instance
# -------------------------
resource "aws_instance" "datacenter_ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
    Name = "datacenter-ec2"
  }
}

# -------------------------
# CloudWatch Alarm
# -------------------------
resource "aws_cloudwatch_metric_alarm" "datacenter_alarm" {
  alarm_name          = "datacenter-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300                # 5 minutes
  statistic           = "Average"
  threshold           = 90
  alarm_description   = "Trigger if CPU usage >= 90% for 5 minutes"

  alarm_actions = [
    aws_sns_topic.sns_topic.arn
  ]

  dimensions = {
    InstanceId = aws_instance.datacenter_ec2.id
  }
}
```

- Add the following content to `outputs.tf`:
```hcl
output "KKE_instance_name" {
  value = aws_instance.datacenter_ec2.tags["Name"]
}

output "KKE_alarm_name" {
  value = aws_cloudwatch_metric_alarm.datacenter_alarm.alarm_name
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