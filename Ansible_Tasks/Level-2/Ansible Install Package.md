# Question
The Nautilus Application development team wanted to test some applications on app servers in Stratos Datacenter. They shared some pre-requisites with the DevOps team, and packages need to be installed on app servers. Since we are already using Ansible for automating such tasks, please perform this task using Ansible as per details mentioned below:

Create an inventory file /home/thor/playbook/inventory on jump host and add all app servers in it.

Create an Ansible playbook /home/thor/playbook/playbook.yml to install samba package on all app servers using Ansible yum module.

Make sure user thor should be able to run the playbook on jump host.

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

To achieve this task using Ansible, you can follow these steps:

1. **Create the Inventory File**:
   - SSH into the jump host.
   - Create an inventory file at `/home/thor/playbook/inventory` on the jump host. This file should list all the app servers you want to target with Ansible. For example:

   ```ini
[app_servers]
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
   ```

2. **Create the Ansible Playbook**:
   - Create an Ansible playbook file at `/home/thor/playbook/playbook.yml` on the jump host. This playbook will use the Ansible `yum` module to install the `samba` package. Here's an example playbook:

   ```yaml
   ---
   - name: Install Samba on App Servers
     hosts: app_servers
     become: yes
     tasks:
       - name: Install Samba
         yum:
           name: samba
           state: present
   ```

   This playbook specifies that it should run on the `app_servers` group defined in the inventory file and uses the `yum` module to install the `samba` package.

3. **Grant Permissions**:
   - Ensure that the user `thor` has the necessary permissions to run Ansible playbooks. You can do this by adding the user `thor` to the `sudoers` file or by using passwordless sudo. Make sure that `thor` has the required privileges.

4. **Test the Playbook**:
   - Test the playbook to ensure it works without passing extra arguments using the `ansible-playbook` command:

   ```bash
   ansible-playbook -i /home/thor/playbook/inventory /home/thor/playbook/playbook.yml
   ```

   This command will use the inventory file and run the playbook on the specified app servers to install the `samba` package.

By following these steps, you can create an inventory file, an Ansible playbook, grant the necessary permissions to the user `thor`, and execute the playbook to install the `samba` package on all app servers in Stratos Datacenter.

Click on confirm to complete the task
