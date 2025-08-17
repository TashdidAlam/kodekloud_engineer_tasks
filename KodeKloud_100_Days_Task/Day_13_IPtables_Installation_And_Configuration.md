# Question
Our security team has raised a concern that Apache’s port (e.g., 5003) is open for all since there is no firewall installed on the app hosts. To address this, we need to install and configure iptables to restrict access as per the requirements below:

**a. Install iptables and all its dependencies on each app host.**
**b. Block incoming port 5003 on all apps for everyone except for the LBR host (e.g., 172.16.238.14).**
**c. Make sure the rules remain, even after system reboot.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Log in to the App Server**
- Connect to the target server using SSH.
  ```
  ssh tony@stapp01
  ```
  > *Establishes a secure shell session to the app server as user tony.*

**Step 2: Switch to the root user**
- Gain root privileges to install and configure iptables.
  ```
  sudo su -
  ```
  > *Switches to the root user for administrative access.*

**Step 3: Install iptables service and dependencies**
- Install the iptables-services package.
  ```
  yum install -y iptables-services
  ```
  > *Installs iptables and its service management tools.*

**Step 4: Start and enable the iptables service**
- Ensure iptables is running and enabled at boot.
  ```
  systemctl start iptables
  systemctl enable iptables
  ```
  > *Starts the iptables service and enables it to start automatically on system boot.*

**Step 5: Add iptables rules to restrict access to port 5003**
- Allow only the LBR host to access port 5003, then block everyone else.
  ```
  iptables -A INPUT -p tcp --destination-port 5003 -s 172.16.238.14 -j ACCEPT
  iptables -A INPUT -p tcp --destination-port 5003 -j DROP
  ```
  > *The first rule allows traffic from the LBR host to port 5003. The second rule blocks all other traffic to port 5003.*

**Step 6: Add additional iptables rules as required**
- List rules with line numbers and replace a rule to reject ICMP if needed.
  ```
  iptables -L --line-numbers
  iptables -R INPUT 5 -p icmp -j REJECT
  ```
  > *Lists all rules with line numbers and replaces the 5th rule in the INPUT chain to reject ICMP packets.*

**Step 7: Save iptables rules for persistence**
- Save the current rules so they remain after reboot.
  ```
  service iptables save
  ```
  > *Saves the current iptables rules to disk for persistence across reboots.*

**Step 8: Restart iptables and validate service status**
- Restart the iptables service and check its status.
  ```
  systemctl restart iptables
  systemctl status iptables
  ```
  > *Restarts iptables and confirms it is running properly.*

**Step 9: Validate iptables rules and test connectivity**
- List rules and test access to the Apache port from different hosts.
  ```
  iptables -L
  telnet stapp01 5003
  curl http://stapp01:5003
  ```
  > *Lists the current rules and tests that only the LBR host can access port 5003, while others are blocked.*

> **Note:** Repeat these steps on all app servers (stapp01, stapp02, stapp03) as required.

**Step 10: Complete the task**
- Click on Finish & Confirm to complete the task successfully.