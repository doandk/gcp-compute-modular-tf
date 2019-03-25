#!/bin/sh

if [ -f /etc/redhat-release ]; then
  yum update
  sudo yum install wget telnet unzip -y >> install.log
  sudo setenforce 0
  sudo sed -i s/^SELINUX=.*$/SELINUX=permissive/ /etc/selinux/config
  sudo timedatectl set-timezone Asia/Jakarta
fi

if [ -f /etc/lsb-release ]; then
  apt update
  sudo timedatectl set-timezone Asia/Jakarta
fi


cat <<EOF >> ~/welcome.txt
Your VM is ready!
Package installed : wget, telnet, unzip.
Timezone : Asia/Jakarta (WIB)
EOF

