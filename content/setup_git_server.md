---
date: 2025-10-04
tags: backup, git, homelab, linux, selfhosting
---
# Setting up a home git server

These are notes to my future self about setting up a home git server. The goal
is to self-host a git server for personal projects, fun, and backing up all my
git repos currently hosted on GitHub.

## Infrastructure

- Intel NUC, Core i5, 16GB
- [Proxmox 9.0](https://www.proxmox.com/en/) as hypervisor, codename `pickle`

```
root@pickle:~# fastfetch
         .://:`              `://:.             root@pickle
       `hMMMMMMd/          /dMMMMMMh`           -----------
        `sMMMMMMMd:      :mMMMMMMMs`            OS: Proxmox VE 9.0.3 x86_64
`-/+oo+/:`.yMMMMMMMh-  -hMMMMMMMy.`:/+oo+/-`    Host:  ()
`:oooooooo/`-hMMMMMMMyyMMMMMMMh-`/oooooooo:`    Kernel: Linux 6.14.8-2-pve
  `/oooooooo:`:mMMMMMMMMMMMMm:`:oooooooo/`      Uptime: 3 days, 22 hours, 9 mins
    ./ooooooo+- +NMMMMMMMMN+ -+ooooooo/.        Packages: 726 (dpkg)
      .+ooooooo+-`oNMMMMNo`-+ooooooo+.          Shell: bash 5.2.37
        -+ooooooo/.`sMMs`./ooooooo+-            Display (DELL P2715Q): 3840x2160 @ 60 Hz in 27" [External]
          :oooooooo/`..`/oooooooo:              Terminal: termproxy
          :oooooooo/`..`/oooooooo:              CPU: Intel(R) Core(TM) i5-5250U (4) @ 2.70 GHz
        -+ooooooo/.`sMMs`./ooooooo+-            GPU: Intel HD Graphics 6000 @ 0.95 GHz [Integrated]
      .+ooooooo+-`oNMMMMNo`-+ooooooo+.          Memory: 2.72 GiB / 15.51 GiB (18%)
    ./ooooooo+- +NMMMMMMMMN+ -+ooooooo/.        Swap: 0 B / 8.00 GiB (0%)
  `/oooooooo:`:mMMMMMMMMMMMMm:`:oooooooo/`      Disk (/): 3.35 GiB / 93.93 GiB (4%) - ext4
`:oooooooo/`-hMMMMMMMyyMMMMMMMh-`/oooooooo:`    Local IP (vmbr0): 192.168.0.111/24
`-/+oo+/:`.yMMMMMMMh-  -hMMMMMMMy.`:/+oo+/-`    Locale: en_US.UTF-8
        `sMMMMMMMm:      :dMMMMMMMs`
       `hMMMMMMd/          /dMMMMMMh`
         `://:`              `://:`
```

- [Debian 13 (trixie)](https://www.debian.org/releases/trixie/) VM as the git server: hostname `gitserved`
- [Tailscale](https://tailscale.com/) on `gitserved` making a flat network connecting
    - personal laptop
    - desktop
    - phone
    - EC2 instance
    - Backup server NAS
    - gitserved

In the future I'll add an exit node VM, and a web server VM to the proxmox cluster.

## Setup

### Installing proxmox

- flash usb drive w/ proxmox iso
- boot the machine, use TUI install (graphical failed for some reason)
- default settings, used ethernet as management interface

**Note**: the machine boots into headless mode, but can be ssh'd into at root@ the management interface
  or through the web interface, in this case `http://192.168.0.111:8006`. There's a pain here because
  the laptop is normall on the home wifi network which isn't bridged to the ethernet part due to
  lack of bridging features in the wifi mesh I have. So I have to do some initial setup with laptop
  plugged into ethernet.

Somehow, magically, when tailscale is up, I can route to the hypervisor, but the tailscale network is entirely separate
so this baffles me.

Once proxmox is up and running and I've got access to the web management interface there are a couple of things to note

- on left, under `datacenter`, clicking `pickle` gives a list of actions/options for the hypervisor, including a web shell,
  networking info, and repositories --> disable the ceph and enterprise ones so that the system scheduled `apt update` will work
- under pickle, VM entries will appear with similar actions
- prep a flash drive w/ debian and feed it to the NUC
- Create a new VM:
  - in proxmox, create VM, choose options, use "no OS", finish creation
  - add a pass through for the USB device
  - set the boot order to put USB first (not sure this is necessary, but the boot was getting stuck without it)
  - start the VM
  - install debian like a champ, call it `gitserved`
- setup tailscale on `gitserved`: proxmox web interface, VNC to VM

## Setting up the git server and backing up existing repositories

Stay tuned for the next installment...
