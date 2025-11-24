# Question
One of the Nautilus DevOps team members is working on to develop a role for httpd installation and configuration. Work is almost completed, however there is a requirement to add a jinja2 template for index.html file. Additionally, the relevant task needs to be added inside the role. The inventory file ~/ansible/inventory is already present on jump host that can be used. Complete the task as per details mentioned below:


a. Update ~/ansible/playbook.yml playbook to run the httpd role on App Server 2.


b. Create a jinja2 template index.html.j2 under /home/thor/ansible/role/httpd/templates/ directory and add a line This file was created using Ansible on <respective server> (for example This file was created using Ansible on stapp01 in case of App Server 1). Also please make sure not to hard code the server name inside the template. Instead, use inventory_hostname variable to fetch the correct value.


c. Add a task inside /home/thor/ansible/role/httpd/tasks/main.yml to copy this template on App Server 2 under /var/www/html/index.html. Also make sure that /var/www/html/index.html file's permissions are 0744.


d. The user/group owner of /var/www/html/index.html file must be respective sudo user of the server (for example tony in case of stapp01).


Note: Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml so please make sure the playbook works this way without passing any extra arguments.


---

# ✅ **Step 1 — Update playbook to run httpd role on App Server 2**

Edit the playbook:

```
vi ~/ansible/playbook.yml
```

Content:

```yaml
---
Just add stapp03 in the host change nothing else
```

> This ensures the role is applied only to App Server 2.

---

# ✅ **Step 2 — Create the Jinja2 template**

Create the template directory if it doesn’t exist:

```
mkdir -p ~/ansible/roles/httpd/templates
```

Create template file:

```
vi ~/ansible/roles/httpd/templates/index.html.j2
```

Content:

```jinja
This file was created using Ansible on {{ inventory_hostname }}
```

> `{{ inventory_hostname }}` will dynamically insert the server name.

---

# ✅ **Step 3 — Update the role tasks**

Edit the role’s `main.yml`:

```
vi ~/ansible/roles/httpd/tasks/main.yml
```

Add the task to copy the template:

```yaml
---
- name: Copy index.html template
  template:
    src: index.html.j2
    dest: /var/www/html/index.html
    owner: "{{ ansible_user }}"
    group: "{{ ansible_user }}"
    mode: '0744'
```

> `ansible_user` is picked from inventory and corresponds to the sudo user for that server.
> This ensures the file owner matches the respective sudo user.

---

# ✅ **Step 4 — Directory and file permissions**

Ensure `/var/www/html/` exists (optional, usually httpd installs it):

```yaml
- name: Ensure /var/www/html directory exists
  file:
    path: /var/www/html
    state: directory
    owner: "{{ ansible_user }}"
    group: "{{ ansible_user }}"
    mode: '0755'
```

> Can be placed before the template task in `main.yml`.

---

# ✅ **Step 5 — Run the playbook**

From `~/ansible`:

```
ansible-playbook -i inventory playbook.yml
```

---

# ✅ **Step 6 — Expected outcome**

* `/var/www/html/index.html` exists on **stapp02**.
* Content:

```
This file was created using Ansible on stapp02
```

* Ownership: **steve:steve** (sudo user on stapp02)
* Permissions: **0744** ✅

No extra arguments are needed.

---

