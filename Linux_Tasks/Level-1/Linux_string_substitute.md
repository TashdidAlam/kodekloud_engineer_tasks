# Question

The backup server in the Stratos DC contains several templated XML files used by the Nautilus application. However, these template XML. files must be populated with valid data before they can be used.

**Replace all occurrences of the string `About` to `Cloud` on the XML file `/root/nautilus.xml` located in the `backup server`.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Sign in to Backup Server & Switch to root
```
ssh clint@stbkp01
```
```
sudo su -
```
Pull out the string About on the XML file /root/nautilus.xml

```
cat /root/nautilus.xml  |grep About  | wc -l
```

```
cat /root/nautilus.xml  |grep About
```
Replace the string  About  to Cloud with the help of sed command
```
sed -i 's/About/Cloud/g' /root/nautilus.xml
```
Confirm the change in string Cloud 
```
cat /root/nautilus.xml  |grep Cloud
```

Click on confirm to complete the task
