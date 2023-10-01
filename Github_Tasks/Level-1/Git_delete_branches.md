# Question
Nautilus developers are actively working on one of the project repositories, /usr/src/kodekloudrepos/media. They were doing some testing and created few test branches, now they want to clean those test branches. Below are the requirements that have been shared with the DevOps team:

**On Storage server in Stratos DC delete a branch named `xfusioncorp_media` from `/usr/src/kodekloudrepos/media` git repo.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Sign in to Storage Server & swith to root user

```
ssh natasha@ststor01
```
```
sudo su
```

Go to the Repo directory
```
cd /usr/src/kodekloudrepos/media
```
Delete The branch
```
# Delete the branch (only if it's fully merged)
git branch -d xfusioncorp_media

# Force delete the branch (including unmerged changes)
git branch -D xfusioncorp_media
```

If the branch is also present in the remote repository, you need to push the deletion to the remote repository as well

```
git push origin --delete xfusioncorp_media
```
Click on confirm to complete the task
