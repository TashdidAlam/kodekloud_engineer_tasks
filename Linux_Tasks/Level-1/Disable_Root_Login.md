# Question
After doing some security audits of servers, xFusionCorp Industries security team has implemented some new security policies. One of them is to disable direct root login through SSH.

**Disable direct SSH root login on all app servers in Stratos Datacenter.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

> **Note:** The following steps must be performed on all app servers in the Stratos Datacenter (e.g., stapp01, stapp02, stapp03).

# Steps

**Step 1: Log in to the App Server and switch to root**
- Connect to the target app server using SSH and switch to the root user for administrative access.
  ```
  ssh tony@stapp01
  ```
  > *Establishes a secure shell session to the app server as user tony.*
  ```
  sudo su -
  ```
  > *Switches to the root user to allow editing system configuration files.*

**Step 2: Check the current SSH root login setting**
- View the current configuration for root login in the SSH config file.
  ```
  cat /etc/ssh/sshd_config | grep PermitRoot
  ```
  > *Displays lines related to PermitRootLogin to check if root login is currently allowed or commented out.*

**Step 3: Edit the SSH configuration to disable root login**
- Open the SSH configuration file and update the PermitRootLogin setting.
  ```
  vi /etc/ssh/sshd_config
  ```
  > *Opens the SSH configuration file in the vi editor. Change `#PermitRootLogin yes` (or any existing value) to `PermitRootLogin no` to disable direct root login.*

**Step 4: Verify the configuration change**
- Confirm that the PermitRootLogin setting is now set to 'no'.
  ```
  cat /etc/ssh/sshd_config | grep PermitRoot
  ```
  > *Ensures the configuration has been updated as intended.*

**Step 5: Restart the SSH service**
- Apply the changes by restarting the SSH daemon and check its status.
  ```
  systemctl restart sshd && systemctl status sshd
  ```
  > *Restarts the SSH service to apply the new configuration and displays its status to confirm it is running properly.*

**Step 6: Complete the task**
- Click on confirm to complete the task