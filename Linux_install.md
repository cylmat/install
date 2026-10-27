# Linux install


## Pre-prerequisites
```
# sudo apt-get install gettext cmake zip curl
# sudo apt install -y build-essential software-properties-common


sudo systemctl disable snapd
```

## Install Zsh, OhMyZsh and colored prompt

- [cylmat/shell_zsh.sh](https://github.com/cylmat/docs/blob/main/install/shell_zsh.sh)



## Install Docker
```
curl https://github.com/cylmat/docs/blob/main/install/script/docker-cli-install.sh | bash
```

## Install minikube
```
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

## Install tools

- [cylmat/tools_essential.sh](https://github.com/cylmat/docs/blob/main/install/tools_essential.sh)

## Errors and bugs

If Very slow internet connection (linux mint)
```
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
```
and
```
echo "
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
" >> /etc/sysctl.conf

sudo sysctl -p
```

## Others

printer HP  
https://debian-facile.org/doc:materiel:imprimante-hp
```
apt install -y hplip hplip-gui
```

## Docs

- https://docs.docker.com/engine/install/ubuntu
- https://docs.docker.com/engine/install/linux-postinstall
