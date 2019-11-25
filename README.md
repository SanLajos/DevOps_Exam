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

## Do this on the *Jenkins* GUI
### Add new Node
Main Menu > Manage Jenkins >  Manage Nodes >   
1.)  
  - Name: jenkins-slave  
  - Type: Pemanent Agent  

2.)  
  - Description: My .... Jenkins Slave  
  - Remote dir: /var/lib/jenkins  
  - Label: slave  
  - Launch: via SSH  
  - Host: 192.168.56.231   
  
Credentials:  
  - Domain: Global  
  - Kind: SSH user with key  
  - Scope: Global  
  - ID: jenkins_slave_ssh  
  - Desc.: SSSH Key for jenkins slave  
  - Username: jenkins  
  - PKey: Enter directly (hint: paste private key)  

  - Host Key Ver. Strat.: No verif....  

### Add new Node
Connect to Git repository  

- At the Project (type: pipeline):  
- Pipeline: Pip. script from SCM  
- SCM: git  
- Repositories:  
- Url: https://github.com/sanlajos/DevOps_Exam
- Cred.:  
- Domain: Global  
- Kind: U & passwd  
- Scope: Global  
- User: git  
- ID: git  
- Desc.: git to repo  

### Important setting
- set Poll SCM: * * * * *