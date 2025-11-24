# Question
The Nautilus DevOps team wants to install and set up a simple httpd web server on all app servers in Stratos DC. Additionally, they want to deploy a sample web page for now using Ansible only. Therefore, write the required playbook to complete this task. Find more details about the task below.



We already have an inventory file under /home/thor/ansible directory on jump host. Create a playbook.yml under /home/thor/ansible directory on jump host itself.


Using the playbook, install httpd web server on all app servers. Additionally, make sure its service should up and running.


Using blockinfile Ansible module add some content in /var/www/html/index.html file. Below is the content:


Welcome to XfusionCorp!

This is  Nautilus sample file, created using Ansible!

Please do not modify this file manually!


The /var/www/html/index.html file's user and group owner should be apache on all app servers.


The /var/www/html/index.html file's permissions should be 0744 on all app servers.


Note:


i. Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml so please make sure the playbook works this way without passing any extra arguments.


ii. Do not use any custom or empty marker for blockinfile module.


---

# ✅ **Step 1 — Create the playbook file**

Create:

```
vi /home/thor/ansible/playbook.yml
```

---

# ✅ **Step 2 — Playbook content**

```yaml
---
- name: Install and configure httpd on all app servers
  hosts: all
  become: yes

  tasks:

    - name: Install httpd package
      yum:
        name: httpd
        state: present

    - name: Ensure httpd service is running and enabled
      service:
        name: httpd
        state: started
        enabled: yes

    - name: Ensure /var/www/html directory exists
      file:
        path: /var/www/html
        state: directory
        owner: apache
        group: apache
        mode: '0755'

    - name: Ensure index.html file exists
      file:
        path: /var/www/html/index.html
        state: touch
        owner: apache
        group: apache
        mode: '0744'

    - name: Add sample content to index.html
      blockinfile:
        path: /var/www/html/index.html
        block: |
          Welcome to XfusionCorp!
          
          This is  Nautilus sample file, created using Ansible!
          
          Please do not modify this file manually!

    - name: Set ownership and permissions of index.html
      file:
        path: /var/www/html/index.html
        owner: apache
        group: apache
        mode: '0744'
```

---

# ✅ **Step 3 — Notes on the playbook**

1. Uses `yum` module to install httpd.
2. Uses `service` module to ensure the httpd service is **running and enabled**.
3. Uses `blockinfile` to insert the exact multi-line content.
4. Uses `file` module to set **owner, group, and permissions** exactly as required.
5. No custom markers for `blockinfile` — complies with validation.
6. Runs on all app servers in the inventory.

---

# ✅ **Step 4 — Run the playbook (for verification)**

From `/home/thor/ansible`:

```
ansible-playbook -i inventory playbook.yml
```

Expected outcome:

```
changed: [stapp01]
changed: [stapp02]
changed: [stapp03]
```

The file `/var/www/html/index.html` should now contain the specified content, with **owner apache**, **group apache**, and **mode 0744**.

---
