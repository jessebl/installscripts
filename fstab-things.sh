# Edit /etc/fstab to automount the NAS at 192.168.1.169
# The mounting commands reference a file /home/jesse/.nas-credentials which contains the CIFS login credentials in a format:
#   username=<username>
#   password=<password>
# Happily, the <password> field is perfectly happy to accept passwords with spaces without using \, "", or any such marks.
# You should set the permissions on .nas-credentials to 600 to keep your credentials safer than they would be otherwise.
echo "//192.168.1.169/multimedia /mnt/nas-multimedia cifs credentials=/home/jesse/.nas-credentials,uid=jesse,gid=jesse,iocharset=utf8,sec=ntlm 0 0" >> /etc/fstab
echo "//192.168.1.169/jesse /mnt/nas-jesse cifs credentials=/home/jesse/.nas-credentials,uid=jesse,gid=jesse,iocharset=utf8,sec=ntlm 0 0" >> /etc/fstab
