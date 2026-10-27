# Install

## Wsl2 from scratch

### Install Wsl2 in HOST
```
wsl -l
wsl --unregister Ubuntu-22.04
(https://learn.microsoft.com/en-us/windows/wsl/use-custom-distro)
wsl --import Ubuntu-22.04 D:\Applications\Ubuntu D:\Applications\Ubuntu\Ubuntu-export-22.04.tar
wsl -l -v
wsl --update
wsl --manage Ubuntu-22.04 --set-default-user username

# change pass
wsl -d Ubuntu-22.04 -u root
passwd root
passwd username

wslconfig /setdefault Ubuntu-22.04  
```

**import from other disk**

```
wsl.exe --list --online
wsl --export docker-desktop D:\Applications\Docker\docker-desktop.tar
wsl --unregister docker-desktop
wsl --import docker-desktop D:\Applications\Docker D:\Applications\Docker\docker-desktop.tar --version 2
```

### in WSL

```
sudo adduser username
echo "[user]" >> /etc/wsl.conf
echo "default=username" >> /etc/wsl.conf

# disable wsl info
touch /username/.hushlogin
sudo systemctl disable snapd
```

etc/resolv.conf in WSL 
```
$ sudo nano /etc/resolv.conf
nameserver 1.1.1.1
nameserver 8.8.8.8

$ sudo chattr +i /etc/resolv.conf
```

### > How to shrink (reduce) Wsl size

check before
```
wsl df -h /
```

- https://stephenreescarter.net/how-to-shrink-a-wsl2-virtual-disk/
```
> wsl --shutdown
> diskpart
      - select vdisk file="C:\Users\rhc7\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_79\LocalState\ext4.vhdx"
      - compact vdisk
```

### Wsl configuration
- https://learn.microsoft.com/fr-fr/windows/wsl/wsl-config

C:\Users\<UserName>\.wslconfig
```
# Settings apply across all Linux distros running on WSL 2
[wsl2]

# Limits VM memory to use no more than 4 GB, this can be set as whole numbers using GB or MB
memory=4GB 

# Sets the VM to use two virtual processors
processors=2

# Specify a custom Linux kernel to use with your installed distros. The default kernel used can be found at https://github.com/microsoft/WSL2-Linux-Kernel
kernel=C:\\temp\\myCustomKernel

# Specify the modules VHD for the custum Linux kernel to use with your installed distros.
kernelModules=C:\\temp\\modules.vhdx

# Sets additional kernel parameters, in this case enabling older Linux base images such as Centos 6
kernelCommandLine = vsyscall=emulate

# Sets amount of swap storage space to 8GB, default is 25% of available RAM
swap=8GB

# Sets swapfile path location, default is %USERPROFILE%\AppData\Local\Temp\swap.vhdx
swapfile=C:\\temp\\wsl-swap.vhdx

# Disable page reporting so WSL retains all allocated memory claimed from Windows and releases none back when free
pageReporting=false

# Turn on default connection to bind WSL 2 localhost to Windows localhost. Setting is ignored when networkingMode=mirrored
localhostforwarding=true

# Disables nested virtualization
nestedVirtualization=false

# Turns on output console showing contents of dmesg when opening a WSL 2 distro for debugging
debugConsole=true

# Enable experimental features
[experimental]
sparseVhd=true

```

\wsl.localhost\Ubuntu-20.04\etc\wsl.conf
```
# Automatically mount Windows drive when the distribution is launched
[automount]

# Set to true will automount fixed drives (C:/ or D:/) with DrvFs under the root directory set above. Set to false means drives won't be mounted automatically, but need to be mounted manually or with fstab.
enabled = true

# Sets the directory where fixed drives will be automatically mounted. This example changes the mount location, so your C-drive would be /c, rather than the default /mnt/c. 
root = /

# DrvFs-specific options can be specified.  
options = "metadata,uid=1003,gid=1003,umask=077,fmask=11,case=off"

# Sets the `/etc/fstab` file to be processed when a WSL distribution is launched.
mountFsTab = true

# Network host settings that enable the DNS server used by WSL 2. This example changes the hostname, sets generateHosts to false, preventing WSL from the default behavior of auto-generating /etc/hosts, and sets generateResolvConf to false, preventing WSL from auto-generating /etc/resolv.conf, so that you can create your own (ie. nameserver 1.1.1.1).
[network]
hostname = DemoHost
generateHosts = false
generateResolvConf = false

# Set whether WSL supports interop processes like launching Windows apps and adding path variables. Setting these to false will block the launch of Windows processes and block adding $PATH environment variables.
[interop]
enabled = false
appendWindowsPath = false

# Set the user when launching a distribution with WSL.
[user]
default = DemoUser

# Set a command to run when a new WSL instance launches. This example starts the Docker container service.
[boot]
command = service docker start
```

### linux install

- [cylmat/Linux_install.md](https://github.com/cylmat/docs/blob/main/install/Linux_install.md)



### Enable VsCode

- remove Windows C:\Users\username\vscode-remote-wsl  
- remove C:\Users\username\.vscodewsl --shutdownwslconfig /setdefault Ubuntu-22.04  

```
sudo apt-get update && sudo apt-get install wget ca-certificates

# (happen /mnt/xxx features and .vscode-server in PATH)
echo '[automount]
enabled = true
options = "metadata,uid=1000,gid=1000,umask=0022,fmask=11,case=off"

[interop]
enabled=true
appendWindowsPath=true' >> /etc/wsl.conf
```

## Windows app

Manager
* MS Store Ubuntu : https://apps.microsoft.com/store/detail/ubuntu-22042-lts/9PN20MSR04DW
* MS Store PowerToys : https://apps.microsoft.com/store/detail/microsoft-powertoys/XP89DCGQ3K6VLD
* Choco : https://docs.chocolatey.org/en-us/choco/setup#non-administrative-install

Dev
* https://code.visualstudio.com/download
* https://www.postman.com/downloads
* https://notepad-plus-plus.org/downloads

App
* https://www.docker.com/products/docker-desktop
* https://portswigger.net/burp/communitydownload
* https://insomnia.rest
* https://www.wireshark.org/download.html


### VSCode

(https://devfonts.gafi.dev)
```
https://www.jetbrains.com/lp/mono
https://fonts.google.com/specimen/Fira+Code
"editor.fontFamily": "JetBrains Mono, Fira Code, Consolas, Courier New, monospace"
"editor.fontLigatures": true,
```

### Extensions

Chrome
- Dev apps : https://chromewebstore.google.com/category/extensions/productivity/developer
- Password manager : https://bitwarden.com/browser-start (or https://proton.me/fr/pass)
- Secure shell : https://chromewebstore.google.com/detail/secure-shell
- Api tester : https://chromewebstore.google.com/detail/talend-api-tester-free-ed
- Raindrop.io : Bookmarks manager
- https://bitwarden.com

+

Firefox
* Web dev ext : https://addons.mozilla.org/fr/firefox/extensions/category/web-development/  
* Add ons : https://addons.mozilla.org/fr/firefox/addon  
  - cookie-quick-manager, feedbroreader, firephp, modify-header-value, notes-by-firefox
  - switchyomega, tweak-extension, vue-js-devtools, xdebug-helper-for-firefox
  - html-validator, colorzilla, fireshot, measure-it, firephp, http-header-live
  - firebug-and-web-development, web-developer, Dark Reader, RESTClient


## Docs

**Wsl**
- https://dev.to/mefaba/installing-wsl-on-another-drive-in-windows-5c4a

- https://learn.microsoft.com/en-us/training/modules/wsl-introduction
- https://learn.microsoft.com/en-us/windows/wsl/install
- https://learn.microsoft.com/en-us/windows/wsl/install-manual
- https://docs.microsoft.com/fr-fr/windows/wsl/file-permissions
  
- Fix DNS resolution in WSL2 : https://gist.github.com/coltenkrauter/608cfe02319ce60facd76373249b8ca6
- https://www.cloudflare.com/fr-fr/learning/dns/what-is-1.1.1.1

**Docker**
- Installer Docker : https://www.paulsblog.dev/how-to-install-docker-without-docker-desktop-on-windows


