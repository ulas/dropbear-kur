#! /bin/bash
#
# 
#
# Debian ve Ubuntu için 
# Dropbear kurulum betiği 
#
#

clear
cd /tmp
echo "Debian ve Ubuntu için Dropbear kurulum betiği"
echo "================================================="
echo "" 
echo "Kurulum başlıyor..."
apt-get update  > /dev/null 2>&1
echo ""
echo "Dropbear portları açılıyor"
echo ""
apt-get -y install dropbear ssh
sed -i 's/NO_START\=1/NO_START\=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT\=22/DROPBEAR_PORT\=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS\=/DROPBEAR_EXTRA_ARGS\=\"\-p 443 \-p 109 \-p 110\"/g' /etc/default/dropbear
sed -i 's/#PermitRootLogin prohibit\-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin without\-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service dropbear start
service sshd restart
echo ""
echo ""
echo "Dropbear başarıyla yüklendi"
echo "Dropbear için açılan portlar: 443, 109, 110"
echo ""
echo ""
echo "server yeniden başlatılıyor..."
echo ""
sleep 5 ; reboot