# Question
We have confidential data that needs to be transferred to a remote location, so we need to encrypt that data.We also need to decrypt data we received from a remote location in order to understand its content.

**On storage server in Stratos Datacenter we have private and public keys stored at `/home/*_key.asc`. Use these keys to perform the following actions.**

- Encrypt `/home/encrypt_me.txt` to `/home/encrypted_me.asc`.

- Decrypt `/home/decrypt_me.asc` to `/home/decrypted_me.txt`. (Passphrase for decryption and encryption is `kodekloud`).

- The user ID you can use is `kodekloud@kodekloud.com`.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**Login on storage server & switch to root user**
```bash
ssh natasha@ststor01
```
```bash
sudo su- 
```
**Navigate to Home directory**
```bash
cd /home/
```
**Import gpg Private & Public key**
```bash
gpg --import public_key.asc
gpg --import private_key.asc
```
**Will encrypt the file txt in to asc in same folder path**
```bash
gpg --encrypt --recipient kodekloud@kodekloud.com --output /home/encrypted_me.asc /home/encrypt_me.txt
```
**Will decrypt the file asc in to txt  using passphrase within same folder path**
```bash
gpg --decrypt --output /home/decrypted_me.txt /home/decrypt_me.asc
```

**check the encrpyted & decrypted files  in  /home**
```bash
ls -la /home/
```
**Validate the task by cat the files output**
```bash
cat decrypted_me.txt
cat encrypted_me.asc
```
Click on confirm to complete the task