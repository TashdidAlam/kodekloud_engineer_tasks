# Question
xFusionCorp Industries has planned to set up a common email server in Stork DC. After several meetings and recommendations they have decided to use `postfix` as their mail transfer agent and `dovecot` as an `IMAP/POP3` server. We would like you to perform the following steps:

**1. Install and configure `postfix` on `Stork DC mail server`.**

**2. Create an email account `john@stratos.xfusioncorp.com` identified by `dCV3szSGNA`.**

**3. Set its mail directory to `/home/john/Maildir`.**

**4. Install and configure `dovecot` on the same server.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

SSH into the mail server and switch to root
```
ssh groot@stmail01
```
```
sudo su
```

Install Postfix 
```
yum install postfix -y
```
Now Change the config file of postfix & edit these options
```
vi /etc/postfix/main.cf
```

```
# Uncomment and add these
myhostname = stratos.xfusioncorp.com
mydomain = xfusioncorp.com
myorigin = $mydomain
## Uncomment and Set inet_interfaces to all ##
inet_interfaces = all
## Change to all ##
inet_protocols = all
## Comment ##
#mydestination = $myhostname, localhost.$mydomain, localhost
##- Uncomment ##
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
## Uncomment and add IP range ##
mynetworks = 172.16.0.0/16, 127.0.0.0/8
## Uncomment ##
home_mailbox = Maildir/
```
Now start the postfix service
```
systemctl start postfix
systemctl status postfix
```

Now add the user specified in the question
```
useradd john
```

Add the pasword given in the question
```
passwd john
```

Now configure and test postfix
```
telnet localhost smtp
```
Now give these commands

```
ehlo localhost
```
```
mail from:john@stratos.xfusioncorp.com
```
```
rcpt to:john@stratos.xfusioncorp.com
```
```
data
```
```
Hello, Welcome to my mailserver (Postfix)
.
```
```
quit
```
Now check if the mail is being received in john's mail directory
```
su - john
```
Press tab to complete the command
```
cat /home/john/Maildir/new
```
If nothing shows then the postfix configure is not successful

Now install Dovecot
```
yum install dovecot -y
```
Now edit few dovecote configs
```
vi /etc/dovecot/dovecot.conf
```
Uncomment or add these
```
protocols = imap pop3 lmtp
listen = *, :: 
```
Edit auth file
```
vi /etc/dovecot/conf.d/10-auth.conf
```
```
disable_plaintext_auth = no
auth_mechanisms = plain login
```
edit mail file
```
vi /etc/dovecot/conf.d/10-mail.conf
```
Uncomment this
```
mail_location = maildir:~/Maildir
```
Now edit the master config
```
vi /etc/dovecot/conf.d/10-master.conf
```
Uncomment these and add postfix to user and group
```
mode = 0666
user = postfix
group = postfix
```
Start dovecot service
```
systemctl start dovecot
systemctl status dovecot
```

Now test the email from dovecot
```
telnet localhost pop3
```
```
user john
```
```
pass dCV3szSGNA
```
```
retr 1
```
If it shows the email sent earlier then quit
```
quit
```
Click on confirm to complete the task