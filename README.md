PostgreSQL Cluster example playbook
======

This example playbook will install PostgreSQL 10 cluster within docker lab environment.

**This is not meant for Production. Testing ONLY**

Cluster scheme:
  - Master
    - Slave1 = Physical replica. All databases and stuff.
    - Slave2 = Logical replica. Only a and b tables from test database.

Dependencies
=====
You will need Ansible 2.8.0.
This playbook also uses my [postgresql role](https://github.com/EvilGn0me/postgresql-role).
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
This is pretty simple. First you may want to place your ssh public key to pg_test/authorized_keys.
after that just build containers with compose.
Containers here are Centos7 with systemd enabled.
~~~~
docker-compose build
~~~~
and launch them
~~~~
docker-compose up -d
~~~~
Lab env working within 172.14.88.0/24 network. I code mostly on MacBook and docker for mac doesn't have access to containers.
So ports for SSH must be exposed.
- 50001 - Master
- 50002 - Physical Slave
- 50003 - Logical Slave

Ansible Stuff
=====
Well after you finished with lab env.
Its time to apply playbook to containers.

~~~~
ansible-playbook -i example pgtest.yml
~~~~

After playbook applied you should be able to test replication. No errors should appear.
