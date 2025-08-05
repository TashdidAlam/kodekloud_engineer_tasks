# Question
The Nautilus system admins team has prepared scripts to automate several day-to-day tasks. They want them to be deployed on all app servers in Stratos DC on a set schedule. Before that they need to test similar functionality with a sample cron job. Therefore, perform the steps below:

**a. Install `cronie` package on all `Nautilus app servers` and start `crond` service.**

**b. Add a cron `*/5 * * * * echo hello > /tmp/cron_text` for root user.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Log in to each App Server and switch to root user**
- Connect to each app server and gain root privileges.
  ```
  ssh tony@stapp01
  sudo su
  ```
  > *Establishes a secure shell session to the app server as user tony, then switches to root for administrative access.*

**Step 2: Install and start the cronie package**
- Install the cron service and ensure it is running.
  ```
  yum install cronie -y
  ```
  > *Installs the cronie package, which provides the cron service for scheduling jobs. The `-y` flag auto-confirms prompts.*
  ```
  systemctl start crond.service
  systemctl status crond.service
  ```
  > *Starts the cron daemon and checks its status to ensure it is running.*

**Step 3: Create the cron job for the root user**
- Edit the root user's crontab to add the required job.
  ```
  crontab -e
  ```
  > *Opens the root user's crontab file for editing.*
  - Add the following line to schedule the job every 5 minutes:
    ```
    */5 * * * * echo hello > /tmp/cron_text
    ```
    > *This cron job writes 'hello' to /tmp/cron_text every 5 minutes, as required by the task.*

**Step 4: Verify the cron job is set**
- List the current cron jobs for the root user.
  ```
  crontab -l
  ```
  > *Displays the list of scheduled cron jobs for the root user to confirm the entry was added.*

**Step 5: Validate cron job execution**
- Check if the cron job output file is created.
  ```
  ls -la /tmp/
  ```
  > *Lists files in /tmp to verify that cron_text is being created by the cron job.*

> **Note:** The above steps are shown for App Server 1. Repeat the same steps on all other app servers as required.

**Step 6: Complete the task**
- Click on confirm to complete the task
