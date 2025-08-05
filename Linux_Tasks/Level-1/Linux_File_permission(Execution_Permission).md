# Question
There are new requirements to automate a backup process that was performed manually by the xFusionCorp Industries system admins team earlier. To automate this task, the team has developed a new bash script `xfusioncorp.sh`. They have already copied the script on all required servers, however they did not make it executable on one the app server i.e `App Server 1` in Stratos Datacenter.

**Please give executable permissions to `/tmp/xfusioncorp.sh` script on `App Server 1`. Also make sure every user can execute it.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Log in to App Server 1**
- Connect to the target server using SSH.
  ```
  ssh tony@stapp01
  ```
  > *Establishes a secure shell session to App Server 1 as user tony.*

**Step 2: Switch to the root user**
- Gain root privileges to modify file permissions.
  ```
  sudo su
  ```
  > *Switches to the root user to allow changing file permissions system-wide.*

**Step 3: List the existing file permissions**
- Check the current permissions of the script.
  ```
  ls -ltr /tmp/xfusioncorp.sh
  ```
  > *Displays the current permissions, owner, and group for the script file.*

**Step 4: Add execute permission for all users**
- Grant execute and read permissions to others (all users).
  ```
  chmod o+rx /tmp/xfusioncorp.sh
  ```
  > *Adds read and execute permissions for 'others', ensuring any user can execute the script as required by the task.*

**Step 5: Verify the updated permissions**
- Confirm the script is now executable by all users.
  ```
  ls -ltr /tmp/xfusioncorp.sh
  ```
  > *Checks that the permissions have been updated as intended.*

**Step 6: Test script execution**
- Run the script to ensure it executes properly.
  ```
  sh /tmp/xfusioncorp.sh
  ```
  > *Executes the script to verify it works after permission changes.*

**Step 7: Complete the task**
- Click on confirm to complete the task
