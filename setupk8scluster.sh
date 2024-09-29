#!/bin/bash

#Disable Swap & and Add kernel Parameters
$ sudo swapoff -a
$ sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab


$ sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
$ sudo modprobe overlay
$ sudo modprobe br_netfilter


$ sudo tee /etc/sysctl.d/kubernetes.conf <<EOT
net.bridge.bridge-nf-call-ip6tables = 1z
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOT


$ sudo sysctl --system

#Install Container runtime Using Containerd


$ sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates



$ sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"


$ sudo apt update
$ sudo apt install -y containerd.io

$ containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
$ sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml


$ sudo systemctl restart containerd
$ sudo systemctl enable containerd


## Add Apt Repositories
# Kuberenetes package is not available in the default   Ubuntu 22.04 package repositories. So we need to add Kuberentes repostiroy.
# run follwing command to download public signing key

$ curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg


$ echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

##Install kubelet,kubeadm, kubectl 

$ sudo apt update
$ sudo apt install -y kubelet kubeadm kubectl   
$ sudo apt-mark hold kubelet kubeadm kubectl

##Init cluster


$ sudo kubeadm init --control-plane-endpoint=<Your_IP>


##Create Join Command

$ sudo kubeadm token create --print-join-command


## Wave CNI command
$ kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml


## Troubleshooting

kubectl set env daemonset/calico-node -n kube-system IP_AUTODETECTION_METHOD=interface=eth.*
