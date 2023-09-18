# Question
During a routine security audit, the team identified an issue on the Nautilus App Server. Some malicious content was identified within the website code. After digging into the issue they found that there might be more infected files. Before doing a cleanup they would like to find all similar files and copy them to a safe location for further investigation. Accomplish the task as per the following requirements:

**a. On App Server 1 at location `/var/www/html/ecommerce` find out all files (not directories) having `.css` extension.**

**b. Copy all those files along with their parent directory structure to location `/ecommerce` on same server.**

**c. Please make sure not to copy the entire `/var/www/html/ecommerce` directory content.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

First sing into app server 1 and switch to root
```
ssh tony@stapp01
```
```
sudo su
```

Now with this command find all the file extension asked in the task
```
find /var/www/html/ecommerce -type f -name "*.css"
```
Use this command to find and copy the files to the directory

```
find /var/www/html/ecommerce -type f -name '*.css' -exec cp --parents {} /ecommerce \;
```

Check if the files are copied accordingly
```
ls -R /ecommerce
```

Click on confirm to complete the task