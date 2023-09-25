# Question
We have some users on all app servers in Stratos Datacenter. Some of them have been assigned some new roles and responsibilities, therefore their users need to be upgraded with sudo access so that they can perform admin level tasks.

**a. Provide sudo access to user `mariyam` on all app servers.**

**b. Make sure you have set up password-less sudo for the user.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Here only one Application server is shown

First sign into Appserver 1 & switch to root

```
ssh tony@staapp01
```
```
sudo su
```

Edit the sudo file
```
visudo
```
Add this in the end of the file

```
mariyam ALL=(ALL) NOPASSWD: ALL
```

After saving the file test if mariyam user is accesible with out password
```
su - mariyam
```

If all are ok then after updating the other App Servers click on confirm to complete the task