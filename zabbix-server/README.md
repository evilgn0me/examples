Zabbix-server example playbook
======

This example playbook will install Zabbix-server within docker lab environment.

**This is not meant for Production. Testing ONLY**
You can use playbook on your own servers, but docker test lab is a TEST lab.

Dependencies
=====
You will need Ansible 2.8.0.
This playbook uses many roles. Use ansible galaxy to install them all from requirements.yml
Role is written for average server with Systemd. So docker will have some stuff like:
~~~~    
  privileged: true
  cap_add:
  - SYS_ADMIN
~~~~
This is stuff you need to Systemd to work in docker container.

To use this playbook you also need this in your ansible.cfg. Because all variables stored in dictionaries.
And by default dictionaries will be replaced.
~~~~
hash_behaviour = merge
~~~~

To install role use galaxy:
~~~~
ansible-galaxy install -r requirements.yml
~~~~

Docker test lab
=====
This is pretty simple. First you may want to place your ssh public key to zbx_test/authorized_keys.
after that just build containers with compose.
Containers here are Ubuntu with systemd enabled.
~~~~
docker-compose build
~~~~
and launch them
~~~~
docker-compose up -d
~~~~
Lab env working within 172.14.89.0/24 network. I code mostly on MacBook and docker for mac doesn't have access to containers.
So ports for SSH must be exposed.
- 80 - zabbix-server
- 50011 - Zabbix-server

Zabbix server web ui will be available at http://zbx.localhost
Make sure that you add this hostname to your hosts file.
~~~~
127.0.0.1 zbx.localhost
~~~~

Ansible Stuff
=====
Well after you finished with lab env.
Its time to apply playbook to containers.

~~~~
ansible-playbook -i example zbxtest.yml
~~~~

After playbook applied you should be able to access zabbix webui http://zbx.localhost. No errors should appear.
