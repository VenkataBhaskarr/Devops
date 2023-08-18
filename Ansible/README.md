Before diving into Ansible we need to know what is configuration and what is configuration management ?
Generally the term configuration is set of properties which can change the behaviour of working of a software generally its done using 
configuration files written in various languages mostly json and yaml
Now configuration management is management of configuration in 'N' number of software applications / servers.
I mean if we ran 100 ec2 instances and we should say, git pull from a repository we can't manually ssh into all 100 servers and make the changes 
right. so we need some sort of automation tool which does this job that is where ANSIBLE comes into picture


## working of ansible

In order to make ansible work we should do a litte setup in the servers that is adding the ansible server's ssh public key to all the 
remote server's ssh authenticated key's file. This process gives ansible server, power to ssh into all the servers without a password

terminology
  - playbooks
  - adhoc commands
  - inventory
playbooks are called ansible files written in yaml which are used to exectue a set of tasks in remote servers
adhoc commands are standalone/individual commands that can run on remote servers
inventory is a file where all of our remote server IP's are stored we can even gorup the IP's for further management.

## Examples
  - adhoc commands
    ansible -i inventory -m "shell" -a "touch redhat"
  - playbooks(test-playbook.yaml)
    - name: Installing and running Nginx
      hosts: all
      become: root

      tasks:
        - name: Install Nginx
          apt:
            name: nginx
            state: present
          
        - name: Run Nginx
          service:
            name: nginx
            state: started
          
  ansible-playbook -i inventory test-playbook.yaml

