# Question
A developer `mark` has been assigned Nautilus project temporarily as a backup resource. As a temporary resource for this project, we need a temporary user for mark. It’s a good idea to create a user with a set expiration date so that the user won't be able to access servers beyond that point.

Therefore, create a user named `mark` on the App Server 1. Set expiry date to `2023-04-15` in Stratos Datacenter. Make sure the user is created as per standard and is in lowercase.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Logging in to App Server 1

```
ssh tony@stapp01
```

```
sudo su
```
Check User existance
```
id mark
```
If not then create user

```
adduser mark
id mark
```

Add expiry date of user `mark`

```
chage -E 2023-04-15 mark
```

Check the new expiry date
```
chage -l mark
```
Click on confirm to complete the task