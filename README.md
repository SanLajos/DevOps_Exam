# DevOps_Exam

# Instructions, setting up the master and slave VM

open a terminal in home folder of Vagrantfile, then:

~~~bash
vagrant up
~~~

# Slave VM

In the home folder of Vagrantfile:

~~~bash
vagrant ssh jenkins_slave
~~~

After login:

~~~bash
sudo su
cat /var/lib/jenkins/.ssh/id_rsa
~~~

Copy the appered private to your local machine, then exit from slave VM's terminal

# Master VM

Before you login you need to know the admin password for Jenkins app:

In Vagranfile home folder:

~~~bash
vagrant ssh jenkins_master
~~~

Then in VM's terminal:

~~~bash
sudo su
cat /var/lib/jenkins/secrets/initialAdminPassword
~~~

Copy the appered string to the login page which you could find in http://192.168.56.230:8080

Install plugins and set admin_password

Before u start to build set the slave-node

Go to node management

Here add the preivously added slave-VM (here need your private key).

Then you could start to build your pipeline.