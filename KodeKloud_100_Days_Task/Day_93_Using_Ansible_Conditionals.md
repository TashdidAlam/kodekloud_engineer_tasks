# Question
The Nautilus DevOps team had a discussion about, how they can train different team members to use Ansible for different automation tasks. There are numerous ways to perform a particular task using Ansible, but we want to utilize each aspect that Ansible offers. The team wants to utilise Ansible's conditionals to perform the following task:


An inventory file is already placed under /home/thor/ansible directory on jump host, with all the Stratos DC app servers included.


Create a playbook /home/thor/ansible/playbook.yml and make sure to use Ansible's when conditionals statements to perform the below given tasks.


Copy blog.txt file present under /usr/src/data directory on jump host to App Server 1 under /opt/data directory. Its user and group owner must be user tony and its permissions must be 0777 .


Copy story.txt file present under /usr/src/data directory on jump host to App Server 2 under /opt/data directory. Its user and group owner must be user steve and its permissions must be 0777 .


Copy media.txt file present under /usr/src/data directory on jump host to App Server 3 under /opt/data directory. Its user and group owner must be user banner and its permissions must be 0777.


NOTE: You can use ansible_nodename variable from gathered facts with when condition. Additionally, please make sure you are running the play for all hosts i.e use - hosts: all.


Note: Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml, so please make sure the playbook works this way without passing any extra arguments.


---

# ✅ **Step 1 — Create the playbook**

```
vi /home/thor/ansible/playbook.yml
```

---

# ✅ **Step 2 — Playbook content**

```yaml
---
- name: Copy files to app servers using conditionals
  hosts: all
  become: yes
  gather_facts: yes

  tasks:

    - name: Ensure /opt/data directory exists
      file:
        path: /opt/data
        state: directory
        owner: root
        group: root
        mode: '0755'

    - name: Copy blog.txt to stapp01
      copy:
        src: /usr/src/data/blog.txt
        dest: /opt/data/blog.txt
        owner: tony
        group: tony
        mode: '0777'
      when: ansible_nodename == "stapp01.stratos.xfusioncorp.com"

    - name: Copy story.txt to stapp02
      copy:
        src: /usr/src/data/story.txt
        dest: /opt/data/story.txt
        owner: steve
        group: steve
        mode: '0777'
      when: ansible_nodename == "stapp02.stratos.xfusioncorp.com"

    - name: Copy media.txt to stapp03
      copy:
        src: /usr/src/data/media.txt
        dest: /opt/data/media.txt
        owner: banner
        group: banner
        mode: '0777'
      when: ansible_nodename == "stapp03.stratos.xfusioncorp.com"

```

---

# ✅ **Step 3 — Notes**

1. The play runs for **all hosts** (`hosts: all`).
2. The `when` conditional ensures that each file is copied only to its respective host.
3. `ansible_nodename` is used from gathered facts to identify the host.
4. Directory `/opt/data` is ensured to exist first.
5. Ownership and permissions are explicitly set as required.

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

Files:

| Host    | File      | Owner  | Group  | Permissions |
| ------- | --------- | ------ | ------ | ----------- |
| stapp01 | blog.txt  | tony   | tony   | 0777        |
| stapp02 | story.txt | steve  | steve  | 0777        |
| stapp03 | media.txt | banner | banner | 0777        |

---

