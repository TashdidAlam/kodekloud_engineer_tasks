# Question

There are specific access levels for users defined by the xFusionCorp Industries system admin team. Rather than providing access levels to every individual user, the team has decided to create groups with required access levels and add users to that groups as needed. See the following requirements:

**a. Create a group named nautilus_admin_users in all App servers in Stratos Datacenter.**

**b. Add the user mohammed to nautilus_admin_users in all App servers.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Login on All Server (Here only 1 server is shown)

```
ssh tony@stapp01
```

```
sudo su
```

With this command we can create group

```
groupadd nautilus_admin_users
```

Checking if User already present

```
id mohammed
```

```
cat /etc/passwd |grep mohammed
```

If not present then creating the user and adding them to newly created group

```
useradd -G nautilus_admin_users mohammed
```

Validate Task

```
id mohammed
```

```
cat /etc/passwd |grep mohammed
```

Now We need to do same in other servers stapp02 & stapp03.
