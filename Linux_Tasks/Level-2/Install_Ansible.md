# Question
During the weekly meeting, the Nautilus DevOps team discussed about the automation and configuration management solutions that they want to implement. While considering several options, the team has decided to go with Ansible for now due to its simple setup and minimal pre-requisites. The team wanted to start testing using Ansible, so they have decided to use jump host as an Ansible controller to test different kind of tasks on rest of the servers.

**Install `ansible` version `4.10.0` on `Jump host` using `pip3` only. Make sure Ansible binary is available globally on this system, i.e all users on this system are able to run Ansible commands.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Install epel-release on jump host**
- Enable access to additional packages from the EPEL repository.
  ```
  sudo yum install epel-release
  ```
  > *Installs the EPEL repository, which provides extra packages not included in the default repositories. Required for some dependencies.*

**Step 2: Install pip3 (Python 3 package manager)**
- Ensure pip3 is available for installing Python packages globally.
  ```
  sudo yum install python3-pip
  ```
  > *Installs pip3, the package manager for Python 3, needed to install Ansible via pip.*

**Step 3: Install Ansible version 4.10.0 globally using pip3**
- Use pip3 to install the required version of Ansible for all users.
  ```
  sudo pip3 install ansible==4.10.0
  ```
  > *Installs Ansible version 4.10.0 system-wide, making the binary available to all users.*

**Step 4: Verify Ansible installation and version**
- Check that Ansible is installed and available globally.
  ```
  ansible --version
  ```
  > *Displays the installed Ansible version and confirms the binary is accessible from the command line.*

**Step 5: Complete the task**
- Click on confirm to complete the task
