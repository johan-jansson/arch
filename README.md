# installation script for arch linux

## What it does

WARNING: any data on /dev/nvme1n1 is destroyed when running this script

* set swedish keymap and syncronize time using default ntp-server

* /dev/nvme1n1p2 luks2 encrypted ext4 / (root) partition is created and mounted at /mnt
* /dev/nvme1n1p1 non-encrypted boot partition of 500Mb is created and mounted at /mnt/boot

* /dev/sdb is decrypted and mounted at /mnt/home/backup
* /dev/md/raid1 (/dev/sdc and /dev/sdd) is decrypted and mounted at /mnt/home/raid1

* pacstrap of the following packages:
  * base            (archlinux base system)
  * efibootmgr      (EFI boot manager)
  * grub            (grub boot loader)
  * linux           (linux kernel)
  * linux-firmware  (binary blobs for certain hardware)
  * mkinitcpio      (tools to generate initial ram file system s.t. we can boot encrypted root drive)
  * e2fsprogs       (ext4 tools)
  * mdadm           (raid tools)
  * iproute2        (network configuration, routing and tunneling)
  * dhcpcd          (dhcp and dhcpv6 client)
  * wpa_supplicant  (wifi tools)
  * dialog          (needed for *wifi-menu* from wpa_supplicant)
  * wireguard-tools (VPN kernel tools)
  * resolvconf      (dependency of wireguard-tools)
  * sudo            (execute root commands as standard user)
* /mnt/etc/fstab is generated based on the mounted file-systems, as well as tmpfs
* swedish timezone is set assuming CET BIOS-time
* americal english UTF8 locale is set
* swedish keymap is set
* hostname: *mercury* is set
* /mnt/etc/hosts is generated
* dhcp client autostart is enabled
* all users in group wheel have root priviliges via sudo
* user *johan* is created in group users,wheel with *zsh* shell
* root password is disabled
* ext4 MODULE is added to /mnt/etc/mkinitcpio.conf
* encrypt HOOK is added to /mnt/etc/default/grub s.t. we can boot encrypted
* initial ram file system is generated with respect to modified MODULES and HOOK
* install EFI grub in /mnt/boot
* add the cryptdevice of /dev/nvme1n1p2 to grub boot kernel parameters
* generate default grub configuration in /mnt/boot/grub/grub.cfg

* wireguard certificates are copied from /mnt/home/raid1 to /etc/wireguard/
* wireguard autostart is enabled for the new system

* basic packages for new system
  * git 
  * base-devel              (compilers and things used for AUR packages)
  * man-db                  (man pages for base system)
  * neovim                  (texteditor, nvim)
  * zsh                     (z-shell)
  * zsh-syntax-highlighting
  
* xorg with gpu acceleration and audio for new system
  * libx11                  (xorg libraries)
  * libxft                  (?)
  * xorg-server             (xorg display server)
  * xorg-init               (scripts for initializing xorg, ex: startx)
  * xorg-xrandr             (tools for setting display resolution etc, see .xinitrc)
  * xorg-xrdb               (tools for manipulating usb-device settings etc, see .xinitrc)
  * xorg-xinput             (?)
  * xclip                   (clipboard support for xorg)
  * xorg-setxkbmap          (enables setxkbmap in xorg, see .xinitrc)
  * nvidia                  (nvidia gpu drivers)
  * nvidia-settings         (nvidia-settings GUI for controlling the GPU)
  * xorg-fonts-encodings    (?)
  * libxinerama             (dual monitor support, needed by dwm, maybe not by xfce4?)
  * pulseaudio              (pulseaudio audio server, for settings volume, selecting outputs/inputs etc.)
  * pulseaudio-alsa         (pulseaudio interface against ALSA kernel module)
  
* xfce4 installation for new system
  * xfce4                   (bare xfce4 environment)
  * gvfs                    (tools for automounting usb-devices, etc, trash-bin support)
  * xfce4-goodies           (extra software for sensors, etc, including fzf-enabled whiskermenu)
  * ttf-dejavu              (nicer fonts with good UTF8 support)
  
* basic productivity tools for new system
  * keepassxc               (password manager)
  * thunderbird             (email client)
  * syncthing               (secure decentralized syncing)
  * zathura                 (document viewer)
  * zatuhra-pdf-mupdf       (pdf support for zathura via mupdf)

* pulls and tracks configuration using bare repo at github.com/johan-jansson/dot
* example commands:
  * config status
  * config add <file>
  * config commit -am "updated config"
  * config push
