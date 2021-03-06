# installation script for arch linux

_WARNING_: any data on /dev/nvme1n1 is destroyed when running this script

## What it does

* set swedish keymap and syncronize time using default ntp-server

* /dev/nvme1n1p2 luks2 encrypted ext4 / (root) partition is created and mounted at /mnt
* /dev/nvme1n1p1 non-encrypted boot partition of 500Mb is created and mounted at /mnt/boot

* /dev/sdb1 is decrypted and mounted at /mnt/home/backup/
* /dev/md/raid1 (/dev/sdc1 and /dev/sdd1) is decrypted and mounted at /mnt/home/data/

* pacstrap of the following packages:
  * base            (archlinux base system)
  * efibootmgr       (EFI boot manager)
  * grub            (grub boot loader)
  * linux           (linux kernel)
  * linux-firmware   (binary blobs for certain hardware)
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

* wireguard certificates are copied from /mnt/home/data/ to /mnt/etc/wireguard/
* wireguard service is enabled for the new system

* basic packages for new system
  * git 
  * base-devel              (compilers and things used for AUR packages)
  * man-db                  (man pages for base system)
  * neovim                  (texteditor, nvim)
  * zsh                     (z-shell)
  * zsh-syntax-highlighting (syntax highlighting for zsh scripts and other stuff)
  
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
  
* gnome installation for new system
  * gnome                   (gnome environment with tightly integrated softwar)
  * gnome-tweaks            (control panel with advanced gnome settings)
  * ffmpegthumbnailer        (video thumbnails)
  * tumbler                 (image thumbnails)
* enable NetworkManager service s.t. wifi and networking can be configured in the gnome GUI
* enable gdm autostart on boot, allows lockscreen etc.
  
* basic productivity tools for new system
  * keepassxc               (password manager)
  * thunderbird             (email client)
  * syncthing               (secure decentralized syncing)
  * mpv                     (video player)
  * transmission-gtk        (bittorrent client)
  * code                    (open source version of visual studio code - IDE)
  * julia                   (julia programming language for scientific computing)
  * inkscape                (vector graphics tool)
  * gimp                    (raster graphics tool)
  * texstudio               (latex IDE)
  * texlive-core            (latex basic packages)
  * obs-studio              (streaming/recording and overlay software)
  * screenkey               (pressed keys are overlayed desktop)
  * signal-desktop          (encrypted instant messaging, phone calls and video calls)
  * element-desktop         (encrypted and federated group chat)
  
* vim dependencies
  * various dependencies for the current neovim configuration

* pulls and tracks configuration using bare repo at github.com/johan-jansson/dot
* example commands:
  * config status
  * config add <file>
  * config commit -am "updated config"
  * config push
* enforces permissions to johan.users for all of /home
 
* unmounts everything and reboots into fresh system!
