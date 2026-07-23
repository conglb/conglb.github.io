
## Install k8s with ansible in local, multipass


```
echo " \ 
users: \ 
  - default \
  - name: ubuntu \
    sudo: ALL=(ALL) NOPASSWD:ALL \
    ssh_authorized_keys: \
      - $insert your key here$ $(cat ~/.ssh/id_rsa.pub) \
      " >> cloud_init.yaml

multipass launch 22.04 -n k8s-master -c 2 -m 4G -d 30G --cloud-init cloud_init.yaml

multipass launch 22.04 -n k8s-worker -c 2 -m 2G -d 20G --cloud-init cloud_init.yaml
```


```
# Only for air-gapped enviroment
sudo multiplass shell k8s-master
sudo multipass shell k8s-worker
ip route
sudo ip route del default
```

```
# inventory.ini
[k8s_cluster:children]
k8s_servers
k8s_agents

[k8s_servers]
master2 ansible_host=192.168.252.17

[k8s_agents]
worker2 ansible_host=192.168.252.18

# Thiết lập user SSH và các tham số chung
[k8s_cluster:vars]
ansible_user=ubuntu
# ansible_ssh_private_key_file=~/.ssh/id_rsa
```

```
ansible-playbook -i inventory.ini deploy-rke2-airgap.yml
```

After sucess, copy the config from the master to the host.
```
scp ubuntu@192.168.1.17@/etc/rancher/rke2/rke2.yaml ./rke2.yaml
sed -i '' 's/127.0.0.1/192.168.252.17/g' ./rke2.yaml
kubectl get nodes
```


