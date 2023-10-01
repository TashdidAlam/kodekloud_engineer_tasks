# Question
The Nautilus development team started with new project development. They have created different Git repositories to manage respective project's source code. One of the repositories /opt/official.git was created recently. The team has given us a sample index.html file that is currently present on jump host under /tmp directory. The repository has been cloned at /usr/src/kodekloudrepos on storage server in Stratos DC.

**Copy sample `index.html` file from jump host to storage server under cloned repository at `/usr/src/kodekloudrepos/official`, further add/commit the file and push to the `master` branch.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

First Copy the Index file to the /tmp folder from jump server
```
scp /tmp/index.html username@storage-server:/tmp
```
Now sign in to Storage Server & swith to root user

```
ssh natasha@ststor01
```
```
sudo su
```
Now copy the `index.html` file to /usr/src/kodekloudrepos/official
```
cp /tmp/index.html /usr/src/kodekloudrepos/official
```
Now git add/commit & push the change to master branch
```
git add .
```
```
git commit -m 'index.html added'
```
```
git push origin master
```
Click on confirm to complete the task
