# Question
Developers are looking for dependencies to be installed and run on Nautilus app servers in Stratos DC. They have shared some requirements with the DevOps team. Because we are now managing packages installation and services management using Ansible, some playbooks need to be created and tested. As per details mentioned below please complete the task:



a. On jump host create an Ansible playbook /home/thor/ansible/playbook.yml and configure it to install httpd on all app servers.


b. After installation make sure to start and enable httpd service on all app servers.


c. The inventory /home/thor/ansible/inventory is already there on jump host.


d. Make sure user thor should be able to run the playbook on jump host.


Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.


---

# ✅ **Step 1 — Create the playbook file**

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

    - name: Ensure httpd service is started and enabled
      service:
        name: httpd
        state: started
        enabled: yes
```

---

# ✅ **Step 3 — Notes**

1. **Inventory:** The playbook uses `/home/thor/ansible/inventory`, which already contains all app servers.
2. **User:** Run as `thor` — since `become: yes` is included, it will escalate privileges to manage services and packages.
3. **Validation:** This playbook will run without extra arguments or passwords if inventory includes the necessary credentials or SSH key-based login is set up.

---

# ✅ **Step 4 — Run the playbook (for verification)**

From `/home/thor/ansible`:

```
ansible-playbook -i inventory playbook.yml
```

Expected output:

```
changed: [stapp01]
changed: [stapp02]
changed: [stapp03]
```
