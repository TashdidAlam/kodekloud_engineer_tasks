# Question
The Nautilus DevOps team want to install and set up a simple httpd web server on all app servers in Stratos DC. They also want to deploy a sample web page using Ansible. Therefore, write the required playbook to complete this task as per details mentioned below.


We already have an inventory file under /home/thor/ansible directory on jump host. Write a playbook playbook.yml under /home/thor/ansible directory on jump host itself. Using the playbook perform below given tasks:


Install httpd web server on all app servers, and make sure its service is up and running.


Create a file /var/www/html/index.html with content:


This is a Nautilus sample file, created using Ansible!


Using lineinfile Ansible module add some more content in /var/www/html/index.html file. Below is the content:

Welcome to Nautilus Group!


Also make sure this new line is added at the top of the file.


The /var/www/html/index.html file's user and group owner should be apache on all app servers.


The /var/www/html/index.html file's permissions should be 0777 on all app servers.


Note: Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml so please make sure the playbook works this way without passing any extra arguments.

---

# ✅ **Step 1 — Create the playbook file**

```
vi /home/thor/ansible/playbook.yml
```

---

# ✅ **Step 2 — Playbook content**

```yaml
---
- name: Install httpd and deploy sample web page
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

    - name: Create /var/www/html/index.html with initial content
      copy:
        dest: /var/www/html/index.html
        content: "This is a Nautilus sample file, created using Ansible!\n"
        owner: apache
        group: apache
        mode: '0777'

    - name: Add new line at the top of index.html
      lineinfile:
        path: /var/www/html/index.html
        line: "Welcome to Nautilus Group!"
        insertafter: BOF
        owner: apache
        group: apache
        mode: '0777'
```

---

# ✅ **Step 3 — Notes**

1. **httpd installation and service management** is handled by `yum` and `service` modules.
2. **Initial file creation** uses `copy` module with the first content line.
3. **`lineinfile`** adds the new line **at the top** (`insertafter: BOF`).
4. Ownership and permissions are set to **apache:apache** and **0777** for both tasks.
5. No extra arguments are needed; the playbook works with the provided inventory.

---

# ✅ **Step 4 — Run the playbook**

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

After execution, `/var/www/html/index.html` will look like:

```
Welcome to Nautilus Group!
This is a Nautilus sample file, created using Ansible!
```

