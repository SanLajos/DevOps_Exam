#!/bin/bash

hostnamectl set-hostname jenkins-student-slave

yum install java-1.8.0-openjdk-devel -y

yum install firewalld -y
systemctl start firewalld
systemctl enable firewalld

firewall-cmd --add-port=6543/tcp --permanent
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload

useradd -d /var/lib/jenkins jenkins
echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

su - jenkins -c "ssh-keygen -t rsa -C \"Jenkins Agent SSH key\" -N \"\" -f /var/lib/jenkins/.ssh/id_rsa"
su - jenkins -c "touch /var/lib/jenkins/.ssh/authorized_keys"
su - jenkins -c "cat /var/lib/jenkins/.ssh/id_rsa.pub >> /var/lib/jenkins/.ssh/authorized_keys"
su - jenkins -c "chmod 600 /var/lib/jenkins/.ssh/authorized_keys"

mv /tmp/node.sh /var/lib/jenkins/node.sh
chmod +x /var/lib/jenkins/node.sh
chown jenkins:jenkins /var/lib/jenkins/node.sh

mv /tmp/test_node.sh /var/lib/jenkins/test_node.sh
chmod +x /var/lib/jenkins/test_exinode.sh
chown jenkins:jenkins /var/lib/jenkins/test_node.sh

yum -y install epel-release
yum install ShellCheck -y

yum install git -y