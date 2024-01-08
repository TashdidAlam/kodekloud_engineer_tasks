# Question
One of the DevOps team members has created a ZIP archive on jump host in Stratos DC that needs to be extracted and copied over to all app servers in Stratos DC itself. Because this is a routine task, the Nautilus DevOps team has suggested automating it. We can use Ansible since we have been using it for other automating tasks. Below you can find more details about the task:

We have an inventory file under /home/thor/ansible on jump host, which should have all the app servers added already.

There is a ZIP archive /usr/src/data/datacenter.zip on jump host.

Create a playbook.yml under /home/thor/ansible/ on jump host itself to perform the following tasks.

Unzip /usr/src/data/datacenter.zip archive in /opt/data/ location on all app servers.

Make sure the unzipped data must has the respective sudo user as their user and group owner, i.e tony for app server 1, steve for app server 2, banner for app server 3.

The extracted data permissions must be 0655

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

create inventory & playbook files
```
cd  /home/thor/ansible/

```
Inventory
```
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n ansible_user=tony

stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@ ansible_user=steve

stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n ansible_user=banner
```

Check the existing file & verify the inventory file   
```
ansible all -a "ls -ltr /opt/data/" -i inventory
```
Create a playbook as per the task
```
vi playbook.yml
```
```
- name: Extract archive

  hosts: stapp01, stapp02, stapp03

  become: yes

  tasks:

    - name: Extract the archive and set the owner/permissions

      unarchive:

        src: /usr/src/data/datacenter.zip

        dest: /opt/data/

        owner: "{{ ansible_user }}"

        group: "{{ ansible_user }}"

        mode: "0655"
```

Post file saved , run below command to execute the playbook

```
ansible-playbook  -i inventory playbook.yml
```

Validate the task by running the below command
```
ansible all -a "ls -ltr /opt/data/" -i inventory
```
Click on confirm to complete the task
