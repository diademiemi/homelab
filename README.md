# Ansible Project NAS
This a quick and dirty Ansible project contains the playbooks and inventory for my NAS.  

Most code is in my [Jellyfin Ansible Collection](https://github.com/diademiemi/ansible_collection_diademiemi.jellyfin).  

My NAS is running Debian 11 (Bullseye) and has an Intel Arc A380 GPU for video encoding in Jellyfin.  

A simple radarr/sonarr/deluge stack is deployed in Docker to retrieve Linux ISOs. It is exposed with Nginx.

The inventory host assumes a host in your SSH config called `local_server`.  

## Content

### Playbooks
Playbook | Purpose
--- | ---
01-prepare.yml | Install ZFS and Docker
02-jellyfin.yml | Install Jellyfin and Intel Arc encode drivers
03-linux-isos.yml | Install Radarr, Sonarr and Deluge in Docker

## Instructions

Install the Galaxy requirements:
```bash
ansible-galaxy install -r requirements.yml
```

Run the playbooks:
```bash
ansible-playbook playbooks/01-prepare.yml -k
ansible-playbook playbooks/02-jellyfin.yml
ansible-playbook playbooks/03-linux-isos.yml
```
