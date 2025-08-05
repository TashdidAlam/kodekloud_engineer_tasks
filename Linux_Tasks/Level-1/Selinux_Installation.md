# Question
The xFusionCorp Industries security team recently did a security audit of their infrastructure and came up with ideas to improve the application and server security. They decided to use SElinux for an additional security layer. They are still planning how they will implement it; however, they have decided to start testing with app servers, so based on the recommendations they have the following requirements:

**Install the required packages of SElinux on `App server 3` in Stratos Datacenter and disable it permanently for now; it will be enabled after making some required configuration changes on this host. Don't worry about rebooting the server as there is already a reboot scheduled for tonight's maintenance window. Also ignore the status of SElinux command line right now; the final status after reboot should be disabled.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Log in to App Server 3**
- Connect to the target server using SSH.
  ```
  ssh banner@stapp03
  ```
  > *Establishes a secure shell session to App Server 3 as user banner.*

**Step 2: Switch to the root user**
- Gain root privileges to install packages and edit system files.
  ```
  sudo su
  ```
  > *Switches to the root user for administrative access.*

**Step 3: Install SElinux packages**
- Install all required SElinux packages using yum.
  ```
  yum -y install selinux*
  ```
  > *Installs SElinux and related packages. The `-y` flag auto-confirms prompts.*

**Step 4: Check the current SElinux status**
- View the current status and configuration of SElinux.
  ```
  sestatus
  ```
  > *Displays the current operational status of SElinux.*
  ```
  cat /etc/selinux/config | grep SELINUX
  ```
  > *Shows the current configuration lines for SElinux in the config file.*

**Step 5: Disable SElinux permanently**
- Edit the configuration file to set SElinux to disabled.
  ```
  vi /etc/selinux/config
  ```
  > *Opens the SElinux config file in the vi editor. Change the line `SELINUX=enforcing` or `SELINUX=permissive` to:*
  >
  >     SELINUX=disabled
  >
  > *This ensures SElinux will be disabled after the next reboot.*

**Step 6: Verify the configuration change**
- Confirm that the config file now has SElinux set to disabled.
  ```
  cat /etc/selinux/config | grep SELINUX
  ```
  > *Checks that the SELINUX parameter is set to 'disabled'.*

**Step 7: Complete the task**
- Click on confirm to complete the task
