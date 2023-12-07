#!/bin/bash
sudo -i
yum install nfs-utils -y
systemctl enable nfs --now
mkdir -p /srv/share/upload
chown -R nfsnobody:nfsnobody /srv/share/
chmod 0777 /srv/share/upload/
cat << EOF > /etc/exports
/srv/share 192.168.50.11/32(rw,sync,root_squash)
EOF
exportfs -r

