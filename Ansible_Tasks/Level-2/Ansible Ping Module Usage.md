# Question
The Nautilus DevOps team is planning to test several Ansible playbooks on different app servers in Stratos DC. Before that, some pre-requisites must be met. Essentially, the team needs to set up a password-less SSH connection between Ansible controller and Ansible managed nodes. One of the tickets is assigned to you; please complete the task as per details mentioned below:

a. Jump host is our Ansible controller, and we are going to run Ansible playbooks through thor user from jump host.

b. There is an inventory file /home/thor/ansible/inventory on jump host. Using that inventory file test Ansible ping from jump host to App Server 1, make sure ping works.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

To test Ansible ping from the jump host to App Server 1 using the provided inventory file, you can follow these steps:

1. **Generate a SSH key on Jump Host**: Ensure that you have an SSH key pair set up on the jump host (Ansible controller). If not, generate one using the `ssh-keygen` command.

2. **Copy SSH Public Key**: Copy the SSH public key to App Server 1 so that passwordless SSH can be established. Use the `ssh-copy-id` command for this. Replace `<username>` with your username (e.g., `thor`) and `<app_server_1_ip>` with the IP address of App Server 1.

   ```bash
   ssh-copy-id <username>@<app_server_1_ip>
   ```

3. **Test SSH Connection**: Ensure you can SSH from the jump host to App Server 1 without entering a password:

   ```bash
   ssh <username>@<app_server_1_ip>
   ```

   You should be able to log in without a password prompt.

4. **Test Ansible Ping**: Now, you can use Ansible to ping App Server 1. Use the `-i` flag to specify the inventory file and the `-m` flag to specify the ping module.

   ```bash
   ansible -i /home/thor/ansible/inventory -m ping all
   ```

   This command will test the Ansible ping module for all hosts defined in the inventory file. Ensure that it returns a "SUCCESS" message, indicating that Ansible can communicate with App Server 1.

With these steps, you should have a passwordless SSH connection set up between the jump host (Ansible controller) and App Server 1, allowing you to use Ansible for further automation tasks.

Click on confirm to complete the task
