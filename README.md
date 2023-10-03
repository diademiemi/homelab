# Homelab Project

This is my homelab project. It is split across a NAS at home and a dedicated server rented at Hetzner.  These run the applications I self-host.  

The local NAS is used to store media and backups, and runs a Jellyfin instance to serve media. The dedicated server at Hetzner runs 4 VMs, each running a Rancher cluster. The Rancher cluster is completely deployed with Ansible and Terraform. The Rancher clusters are configured and standardised with Fleet. Workloads for the clusters are deployed with ArgoCD, Helm and Kustomize.  

## Table of Contents
- [Homelab Project](#homelab-project)
  - [Table of Contents](#table-of-contents)
  - [Motivation](#motivation)
  - [Hardware](#hardware)
  - [VMs](#vms)
  - [Applications](#applications)
  - [External repositories](#external-repositories)
- [Rancher (Hetzner)](#rancher-hetzner)
  - [Deployment](#deployment)
  - [Backups](#backups)
  - [Content](#content)
  - [Dependencies](#dependencies)
  - [Instructions](#instructions)
- [NAS](#nas)
  - [Content](#content-1)
  - [Dependencies](#dependencies-1)
  - [Instructions](#instructions-1)
- [License](#license)


## Motivation
I have deployed this homelab to learn more about Kubernetes, Rancher, GitOps and general DevOps practices. I leaned into the Rancher ecosystem as it is a very easy to use Kubernetes distribution with a relatively low overhead for its featureset. I have tried to explore as many of the features of Rancher as possible, such as Fleet, ArgoCD, Longhorn, OPA Gatekeeper, CIS scans and more in preparation for exams and certifications related to these technologies, but also out of personal interest.  

I have learnt a lot about Rancher and have an overall very positive experience with it, I feel confident to recommend it to others. I believe I have learnt a lot about Rancher, Kubernetes and DevOps practices in general during this project.  

My goal was to have a homelab that is fully deployed with code, and can be deployed again with minimal effort. I believe I have achieved this goal, and I am very happy with the result. I have reset the cloud server dozens of times, and it is always back up and running within half an hour without me needing to do anything aside from running a single Ansible playbook.  

## Hardware
This is a table of the relevant hardware in my homelab.

| Hostname | Purpose | OS | CPU | RAM | Storage | GPU |
| --- | --- | --- | --- | --- | --- | --- |
| `PizzaTower` | NAS running locally | Debian 11 | Ryzen 7 3800X | 2x32GiB | 3x 4TB HDD (data, 1x redundant), 1x 250GB NVMe (boot) | Intel Arc A380 |
| `OMORI` | Dedicated server at Hetzner | Debian 11 | Intel i7 8700K | 4x32GiB | 2x 1TB NVMe (boot & vm pool, raid) | None |
| `Undertale` | Router, Wireguard connection to Hetzner | VyOS | Intel Celeron N5105 | 8GiB | 1x 120GB NVMEe (boot) | None |

###### My hostnames are decided by a fitting indie game title or most recent indie game I've played!


## VMs
These VMs are ran on the dedicated server (`OMORI`) at Hetzner. I have purchased multiple IP addresses to assign to each VM.  
| Hostname | Purpose | OS | CPU | RAM | Storage |
| --- | --- | --- | --- | --- | --- |
| `Basil` | Rancher upstream cluster | Ubuntu 22.04 | 4 vCPU | 16GiB | 1x 100GiB (boot) |
| `Aubrey` | Rancher cluster for personal applications | Ubuntu 22.04 | 10 vCPU | 48GiB | 1x 350GiB (boot) |
| `Kel` | Rancher cluster for public facing applications | Ubuntu 22.04 | 6 vCPU | 24GiB | 1x 100GiB (boot) |
| `Hero` | Rancher cluster for [Queer Coded](https://github.com/queercoded-dev) (pending) | Ubuntu 22.04 | 6 vCPU | 32GiB | 1x 300GiB (boot) |
###### These are characters from the game OMORI, quite fitting if you are familiar with the story ;)

## Applications
These are the applications I run on my homelab.
| Application | Purpose | Location |
| --- | --- | --- |
| [Rancher](https://rancher.com/) | Kubernetes cluster management | Upstream cluster (`Basil`) |
| [Longhorn](https://longhorn.io/) | Storage for Kubernetes | All rancher clusters |
| [Nextcloud](https://nextcloud.com/) | Personal cloud | Personal cluster (`Aubrey`) |
| [Vaultwarden](https://github.com/dani-garcia/vaultwarden) | Password manager | Personal cluster (`Aubrey`) |
| [GitLab](https://gitlab.com/) | Git mirror | Personal cluster (`Aubrey`) |
| [Nextcloud](https://nextcloud.com/) | Personal cloud | Personal cluster (`Aubrey`) |
| [ArgoCD](https://argoproj.github.io/argo-cd/) | GitOps for workloads | All rancher clusters |
| [Wireguard](https://www.wireguard.com/) | Local network access | dedicated server (`OMORI`), router (`Undertale`) |
| [Jellyfin](https://jellyfin.org/) | Media server | NAS (`PizzaTower`) |
| [Sonarr](https://sonarr.tv/) | Linux ISO locator | NAS (`PizzaTower`) |
| [Radarr](https://radarr.video/) | Linux ISO locator | NAS (`PizzaTower`) |
| [Deluge](https://deluge-torrent.org/) | Linux ISO fetcher | NAS (`PizzaTower`) |
| [Minio](https://min.io/) | Backup storage | NAS (`PizzaTower`) |

###### I also deploy other workloads that are not managed by this repository and thus are not listed here.

## External repositories
These repositories are included in this project. This includes Ansible roles, collections and Terraform modules.  
| Repository | Type | Purpose |
| --- | --- | --- |
| [ansible_role_docker](https://github.com/diademiemi/ansible_role_docker) | Ansible role | Install Docker on my NAS |
| [ansible_role_rke2](https://github.com/diademiemi/ansible_role_rke2) | Ansible role | Install rke2 on the `Basil` VM for Rancher |
| [ansible_role_helm](https://github.com/diademiemi/ansible_role_helm) | Ansible role | Install Helm on the `Basil` VM for Rancher |
| [ansible_role_openzfs](https://github.com/diademiemi/ansible_role_openzfs) | Ansible role | Install OpenZFS on my NAS |
| [ansible_role_wireguard](https://github.com/diademiemi/ansible_role_wireguard) | Ansible role | Install Wireguard on the `OMORI` host to connect to the `Undertale` router |
| [ansible_collection_diademiemi.jellyfin](https://github.com/diademiemi/ansible_collection_diademiemi.jellyfin) | Ansible collection | Roles to install Jellyfin on my NAS |
| [terraform-libvirt-vm](https://github.com/diademiemi/terraform-libvirt-vm) | Terraform module | Deploy VMs on the `OMORI` host |


# Rancher (Hetzner)

The server at Hetzner runs 4 VMs, each running a Rancher cluster. The VM `Basil` is the upstream cluster, and the other 3 are downstream clusters. Management is done through Rancher on `Basil`.  

The cluster is fully deployed using code in this repository, no manual configuration is required.  

## Deployment

Ansible is used to deploy an OS image to the Rancher dedicated server, this is the standard Debian 11 image provided by Hetzner. After deploying the OS it will reboot the server and log back in to install Libvirt. (`reset/hard-reset.yml`)  

Terraform is called to deploy the VMs and their associated resources. After the VMs are deployed, Ansible is called again to configure basic settings of the VMs and retrieve the public IPs of the VMs, these are once again used by Terraform to configure DNS records. Wireguard is also deployed on the dedicated server to provide access to my local network to the VMs, this is used for backups and reverse proxying. (`01-servers.yml`)

After the VMs are deployed, Ansible is called again to deploy the Rancher cluster on the `Basil` VM. Terraform is then called to configure this new Rancher cluster with my user account and 3 new downstream clusters.  Ansible gets the tokens for the downstream clusters and uses them to deploy the downstream clusters on the remaining VMs. (`02-ranche-upstream.yml`, `03-rancher-downstream.yml`)  

After the VMs are deployed and the Rancher clusters are deployed, Ansible is called again to deploy the fleet projects on the Rancher clusters. This Fleet project deploys standard applications to the clusters, such as Longhorn, OPA Gatekeeper, CIS scans, Cert-manager and ArgoCD. (`04-rancher-config.yml`)  

[SOPS](https://github.com/mozilla/sops) with age is used to encrypt the secrets used in the ArgoCD projects, specifically with the [Kustomize KSOPS plugin](https://gitub.com/viaduct-ai/kustomize-sops). The secret key for each host is stored in Ansible Vault and is deployed to the host during the Rancher configuration deployment. You can see how this is deployed in ArgoCD in the [fleet.yml](./kubernetes/fleet-global/argocd/fleet.yaml) file of this deployment.  

After this is finished and potential backups are restored, a final Fleet project is added to the Rancher clusters to deploy the ArgoCD application to deploy the workloads I want to run on the clusters. (`05-applications.yml`)  

## Backups

All data is stored in Longhorn volumes, which are sent daily to a Minio instance running on my NAS. Before a redeployment of the Rancher clusters, the Longhorn volumes are backed up to the NAS to be restored between the `04-rancher-config.yml` and `05-applications.yml` playbooks. This is done by running the `playbooks/hetzner/backup/create.yml` playbook.  

This writes a temporary file to the host running Ansible to store the backup names to be restored later. This is not strictly necessary, as this can be retrieved manually using the Rancher UI, but this is a simple way to automate the process. In the future, I would like to automate the lookups of the most recent backups as well, so that this can be ran even after an unexpected required redeployment, but this is not a priority at the moment.  

Volumes that already exist in Longhorn are skipped from being restored, so this should be ran before the `05-applications.yml` playbook is ran. This also means that there is no problem with running this playbook multiple times, as it will only restore the volumes that do not exist yet.

## Content
Expand this section to see an overview and explanation of the files related to this deployment.

<details><summary> Click to expand </summary>

File | Type | Purpose
--- | --- | ---
[`playbooks/hetzner/deploy.yml`](./playbooks/hetzner/deploy.yml) | Ansible Playbook | Playbook to call all other playbooks in the correct order
[`playbooks/hetzner/reset/hard-reset.yml`](./playbooks/hetzner/reset/hard-reset.yml) | Ansible Playbook | Playbook to reset the server to a clean state through the Hetzner API
[`playbooks/hetzner/reset/vm-reset.yml`](./playbooks/hetzner/reset/vm-reset.yml) | Ansible Playbook | Playbook to redeploy the VMs through Terraform. This is quicker than the hard reset, but does not reset the physical server
[`playbooks/hetzner/01-servers.yml`](./playbooks/hetzner/01-servers.yml) | Ansible Playbook | Playbook to deploy the VMs through Terraform and configure basic settings
[`playbooks/hetzner/02-rancher-upstream.yml`](./playbooks/hetzner/02-rancher-upstream.yml) | Ansible Playbook | Playbook to deploy the Rancher cluster on the upstream VM
[`playbooks/hetzner/03-rancher-downstream.yml`](./playbooks/hetzner/03-rancher-downstream.yml) | Ansible Playbook | Playbook to deploy the Rancher clusters on the downstream VMs
[`playbooks/hetzner/04-rancher-config.yml`](./playbooks/hetzner/04-rancher-config.yml) | Ansible Playbook | Playbook to configure the Rancher clusters with Fleet and deploy the Fleet projects
[`playbooks/hetzner/05-applications.yml`](./playbooks/hetzner/05-applications.yml) | Ansible Playbook | Playbook to deploy the ArgoCD application to the Rancher clusters
[`playbooks/hetzner/backups/create.yml`](./playbooks/hetzner/backups/create.yml) | Ansible Playbook | Playbook to backups of all Longhorn volumes to the NAS and store the backup names in a temporary file
[`playbooks/hetzner/backups/restore.yml`](playbooks/hetzner/backups/restore.yml) | Ansible Playbook | Playbook to restore the Longhorn volumes from the NAS
[`inventory/main/group_vars/all/main.yml`](./inventory/main/group_vars/all/main.yml) | Ansible Variables | Variables used by all hosts in the inventory. This includes Wireguard options, Hetzner, rke2 and Rancher options
[`inventory/main/host_vars/omori/wireguard.yml`](./inventory/main/host_vars/omori/wireguard.yml) | Ansible Variables | Variables used to deploy Wireguard on the `omori` host. This includes the Wireguard IP addresses, keys and hosts to connect
[`inventory/main/host_vars/omori/system.yml`](./inventory/main/host_vars/omori/system.yml) | Ansible Variables | Variables used to configure the `omori` host.
[`inventory/main/host_vars/basil/main.yml`](./inventory/main/host_vars/basil/main.yml) | Ansible Variables | Variables used by the `basil` host. This includes options for the rke2 deployment and the secret age key
[`inventory/main/host_vars/aubrey/main.yml`](./inventory/main/host_vars/aubrey/main.yml) | Ansible Variables | Variables used by the `aubrey` host. This includes the cluster name and secret age key
[`inventory/main/host_vars/kel/main.yml`](./inventory/main/host_vars/kel/main.yml) | Ansible Variables | Variables used by the `kel` host. This includes the cluster name and secret age key
[`inventory/main/host_vars/hero/main.yml`](./inventory/main/host_vars/hero/main.yml) | Ansible Variables | Variables used by the `hero` host. This includes the cluster name and secret age key
[`inventory/main/host_vars/localhost/terraform.yml`](./inventory/main/host_vars/localhost/terraform.yml) | Ansible Variables | Variables used that are fed into Terraform. This includes extra DNS records, Cloudflare variables and the Rancher users so that they can be encrypted with Ansible Vault
[`inventory/main/host_vars/localhost/hetzner.yml`](./inventory/main/host_vars/localhost/hetzner.yml) | Ansible Variables | Variables used that are used to communicate with the Hetzner API
[`terraform/vms/*.tf`](./terraform/vms/) | Terraform | Terraform files to deploy the VMs to the dedicated server
[`terraform/vms/vms.tf`](./terraform/vms/vms.tf) | Terraform | Terraform file to include my [terraform-libvirt-vm](https://github.com/diademiemi/terraform-libvirt-vm/) module with variables
[`terraform/vms/env/vars.tfvars`](./terraform/vms/env/vars.tfvars) | Terraform Variables | Variables used by the Terraform files
[`terraform/dns/*.tf`](./terraform/dns/) | Terraform | Terraform files to deploy the DNS records to Cloudflare. Variables are retrieved by Ansible
[`terraform/rancher/*.tf`](./terraform/rancher/) | Terraform | Terraform files to configure the Rancher cluster
[`terraform/rancher/env/vars.tfvars`](./terraform/rancher/env/vars.tfvars) | Terraform Variables | Configuration for the downstream clusters

</details>

## Dependencies
Before proceeding, the following packages need to be present on your system:
- `ansible`
- `terraform`
- `mkisofs`
- `xsltproc`

## Instructions

Install the Ansible requirements:
```bash
ansible-galaxy install -r requirements.yml
```

Run the playbooks:
```bash
ansible-playbook playbooks/hetzner/deploy.yml
```

Run the playbooks and reset the server:
```bash
ansible-playbook playbooks/hetzner/deploy.yml --tags=reset
```

Run the playbooks and reset the server without creating backups
```bash
ansible-playbook playbooks/hetzner/deploy.yml --tags=reset --skip-tags=backup
```

# NAS

My NAS is quite simple and hosts mostly backups and media. Jellyfin is deployed as a frontend for my media, it is installed on bare metal to allow for hardware acceleration with an Intel Arc A380 GPU. Syncthing is also deployed on bare metal to sync my files, but it is not managed in this repository.  

A simple radarr/sonarr/deluge stack is deployed in Docker to fetch "Linux ISOs". It also runs a a Minio instance to store backups from the servers in the cloud.  


Code to deploy Jellyfin is located in my [Jellyfin Ansible Collection](https://github.com/diademiemi/ansible_collection_diademiemi.jellyfin).  

## Content
Expand this section to see an overview and explanation of the files related to this deployment.

<details><summary> Click to expand </summary>

File | Type | Purpose
--- | --- | ---
[`playbooks/nas/deploy.yml`](./playbooks/nas/deploy.yml) | Ansible Playbook | Playbook to call all other playbooks
[`playbooks/nas/01-prepare.yml`](./playbooks/nas/01-prepare.yml) | Ansible Playbook | Install ZFS and Docker
[`playbooks/nas/02-jellyfin.yml`](./playbooks/nas/02-jellyfin.yml) | Ansible Playbook | Install Jellyfin and Intel Arc encode drivers
[`playbooks/nas/03-docker-project.yml`](./playbooks/nas/03-docker-project.yml) | Ansible Playbook | Install Radarr, Sonarr, Deluge and Minio in Docker
[`inventory/main/host_vars/pizzatower/main.yml`](./inventory/main/host_vars/pizzatower/main.yml) | Ansible Variables | Variables for the NAS deployment

</details>

## Dependencies
Before proceeding, the following packages need to be present on your system:
- `ansible`

## Instructions

Install the Ansible requirements:
```bash
ansible-galaxy install -r requirements.yml
```

Run the playbooks:
```bash
ansible-playbook playbooks/nas/deploy.yml
```

# License
The code in this project is licensed under the [MIT License](./LICENSE). While my specific setup might not be useful to you, I hope that you can learn something from it and how I use Ansible, Terraform, Rancher and other tools to manage infrastructure. I hope the files in this repository can serve to be a good example of how to integrate all these tools into a single project in a fully automated and DevOps way!  

Please feel free to open an issue if you have any questions on why I did something a certain way or if you have any suggestions on how to improve my setup, I'm always looking to learn more! I will not be providing support for running code this repository, as it is very specific to my setup, but I will try to answer any questions you might have.  
###### I provide no warranty that this code will work for you and I am not responsible for any damages that may be caused by using this code.  
