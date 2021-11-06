# Vagrant Kubernetes Cluster

Bootstrap a local 3 node Kubernetes cluster with a single command and the help of Vagrant, Ansible and Kubeadm.
Because Ansible will run as a local installation on the remote machines, it's also possible to create the cluster on a Windows host.

## Prerequisites

- [Vagrant](https://www.vagrantup.com)
- [VirtualBox](https://www.virtualbox.org)

## Provision the Kubernetes cluster

```text
vagrant up
```

That's it! Vagrant will start provisioning the cluster starting with the control plane node and afterwards the 2 worker nodes.
Because we start from a vanilla Debian 11 (Bullseye) box and we also have to install and run Ansible on every machine, it can take a while for all 3 machines and the cluster to be ready. On my home machine it takes about 15 minutes for the cluster to be up and running.

The recommended hardware specs for a Kubernetes cluster are 2 GB of RAM and 2 CPUs.
With 2 CPUs set on the boxes I had issues with the controller manager and the scheduler always restarting after some time. With 3 CPUs per box everything works fine for me. Maybe it'll work for you with 2 CPUs. Have a try.

## Work with the cluster

```text
vagrant ssh controlplane
```

Afterwards you can work with the cluster using `kubectl`.

## Delete cluster

```text
vagrant destroy -f
```

## Technical details

### Machines

|     Name     |   IP address   |
|--------------|----------------|
| controlplane | 192.168.111.11 |
|   worker-1   | 192.168.111.12 |
|   worker-2   | 192.168.111.13 |

### Container runtime

[containerd](https://containerd.io)

### Pod network

[Calico](https://docs.projectcalico.org/about/about-calico)

CIDR: `192.168.0.0/16`
