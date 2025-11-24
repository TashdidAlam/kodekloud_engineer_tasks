# Question
There are some files that need to be created on all app servers in Stratos DC. The Nautilus DevOps team want these files to be owned by user root only however, they also want that the app specific user to have a set of permissions on these files. All tasks must be done using Ansible only, so they need to create a playbook. Below you can find more information about the task.



Create a playbook named playbook.yml under /home/thor/ansible directory on jump host, an inventory file is already present under /home/thor/ansible directory on Jump Server itself.


Create an empty file blog.txt under /opt/dba/ directory on app server 1. Set some acl properties for this file. Using acl provide read '(r)' permissions to group tony (i.e entity is tony and etype is group).


Create an empty file story.txt under /opt/dba/ directory on app server 2. Set some acl properties for this file. Using acl provide read + write '(rw)' permissions to user steve (i.e entity is steve and etype is user).


Create an empty file media.txt under /opt/dba/ on app server 3. Set some acl properties for this file. Using acl provide read + write '(rw)' permissions to group banner (i.e entity is banner and etype is group).


Note: Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml so please make sure the playbook works this way, without passing any extra arguments.


```
ansible-playbook -i inventory playbook.yml
```

---

# ✅ **Step 1 — Create the playbook file**

```
vi /home/thor/ansible/playbook.yml
```

---

# ✅ **Step 2 — Playbook content**

```yaml
---
- name: Create files with ACLs on app servers
  hosts: all
  become: yes

  tasks:

    - name: Ensure /opt/dba directory exists
      file:
        path: /opt/dba
        state: directory
        owner: root
        group: root
        mode: '0755'

    - name: Create blog.txt on stapp01
      file:
        path: /opt/dba/blog.txt
        state: touch
        owner: root
        group: root
        mode: '0644'
      when: inventory_hostname == "stapp01"

    - name: Set ACL read permission for group tony on blog.txt
      acl:
        path: /opt/dba/blog.txt
        entity: tony
        etype: group
        permissions: r
        state: present
      when: inventory_hostname == "stapp01"

    - name: Create story.txt on stapp02
      file:
        path: /opt/dba/story.txt
        state: touch
        owner: root
        group: root
        mode: '0644'
      when: inventory_hostname == "stapp02"

    - name: Set ACL read+write permission for user steve on story.txt
      acl:
        path: /opt/dba/story.txt
        entity: steve
        etype: user
        permissions: rw
        state: present
      when: inventory_hostname == "stapp02"

    - name: Create media.txt on stapp03
      file:
        path: /opt/dba/media.txt
        state: touch
        owner: root
        group: root
        mode: '0644'
      when: inventory_hostname == "stapp03"

    - name: Set ACL read+write permission for group banner on media.txt
      acl:
        path: /opt/dba/media.txt
        entity: banner
        etype: group
        permissions: rw
        state: present
      when: inventory_hostname == "stapp03"
```

---

# ✅ **Step 3 — Notes**

1. The **directory `/opt/dba`** is ensured to exist first.
2. Each file is created **only on its respective app server** using `when: inventory_hostname == "stapp0X"`.
3. Ownership of all files is **root:root**.
4. ACLs are applied according to the requirements:

| File      | Server  | ACL               |
| --------- | ------- | ----------------- |
| blog.txt  | stapp01 | group tony → r    |
| story.txt | stapp02 | user steve → rw   |
| media.txt | stapp03 | group banner → rw |

5. Validation works with the command:

```
ansible-playbook -i inventory playbook.yml
```

---
