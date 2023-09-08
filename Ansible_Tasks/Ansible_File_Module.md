# Question
The Nautilus DevOps team is working to test several Ansible modules on servers in Stratos DC. Recently they wanted to test the file creation on remote hosts using Ansible. Find below more details about the task:

**a. Create an inventory file `~/playbook/inventory` on jump host and add all app servers in it.**

**b. Create a playbook `~/playbook/playbook.yml` to create a blank file `/usr/src/webdata.txt` on all app servers.

**c. The `/usr/src/webdata.txt` file permission must be `0644`.**

**d. The `user/group` owner of file `/usr/src/webdata.txt must be tony on app server 1, steve on app server 2 and banner on app server 3`.**

**Note: Validation will try to run the playbook using command `ansible-playbook -i inventory playbook.yml`, so please make sure the playbook works this way without passing any extra arguments.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Switch to root
```
sudo su
```
Into Playbook folder create inventory file
```
vi /playbook/inventory
```

Add these into the file
```
stapp01 ansible_host=172.16.238.10 ansible_ssh_pass=Ir0nM@n  ansible_user=tony

stapp02 ansible_host=172.16.238.11 ansible_ssh_pass=Am3ric@  ansible_user=steve

stapp03 ansible_host=172.16.238.12 ansible_ssh_pass=BigGr33n  ansible_user=banner
```

Now create a playbook.yml
```
vi /playbook/playbook.yml
```

Add these into that file

```
- name: Create file in appservers

  hosts: stapp01, stapp02, stapp03

  become: yes

  tasks:

    - name: Create the file and set properties

      file:

        path: /usr/src/webdata.txt

        owner: "{{ ansible_user }}"

        group: "{{ ansible_user }}"

        mode: "0644"


        state: touch
```

Validate the task by running the below command

```
ansible-playbook -i inventory playbook.yml
```
Click on confirm to complete the task