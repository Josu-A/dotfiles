<div id="top"></div>

# My Arch Install

<details>
    <summary>Table of Contets</summary>
    <hr/>
    <ol>
        <li><a href="#installer-setup">Installer setup</a>
            <hr/>
            <ol>
                <li><a href="#keyboard">Keyboard</a></li>
                <li><a href="#font">Font</a></li>
                <li><a href="#verify-boot-mode">Verify boot mode</a></li>
                <li><a href="#internet">Internet</a></li>
                <li><a href="#system-clock">System clock</a></li>
                <li><a href="#pacman">Pacman</a></li>
            </ol>
        </li>
        <li><a href="#disks">Disks</a>
            <hr/>
            <ol>
                <li><a href="#preparations">Preparations</a></li>
                <li><a href="#partitioning">Partitioning</a></li>
                <li><a href="#formating">Formating</a></li>
                <li><a href="#mount-partitions">Mount partitions</a></li>
                <li><a href="#swap">Swap</a></li>
            </ol>
        </li>
        <li><a href="#installation">Installation</a>
            <hr/>
            <ol>
                <li><a href="#initial-setup">Initial setup</a></li>
                <li><a href="#file-systems">File systems</a></li>
                <li><a href="#console-text-editor">Console text editor</a></li>
                <li><a href="#time-language-and-locale">Time, language and locale</a></li>
                <li><a href="#network-setup">Network setup</a></li>
                <li><a href="#pacman-setup">Pacman setup</a></li>
                <li><a href="#microcode">Microcode</a></li>
                <li><a href="#graphics-drivers">Graphics drivers</a></li>
                <li><a href="#user-setup">User setup</a></li>
                <li><a href="#initramfs">Initramfs</a></li>
                <li><a href="#boot-loader">Boot loader</a></li>
                <li><a href="#documentation">Documentation</a></li>
                <li><a href="#reboot">Reboot</a></li>
            </ol>
        </li>
        <li><a href="#system-booted-installation">System-booted installation</a>
            <hr/>
            <ol>
                <li><a href="#core-utils">Core utils</a></li>
                <li><a href="#post-installation">Post installation</a></li>
                <li><a href="#network">Network</a></li>
                <li><a href="#pacman-cache">Pacman cache</a></li>
                <li><a href="#pacman-mirrors---reflector">Pacman mirrors - Reflector</a></li>
                <li><a href="#numlock-on-boot">Numlock on boot</a></li>
                <li><a href="#arch-user-repository">Arch user repository</a></li>
                <li><a href="#user-directories">User directories</a></li>
                <li><a href="#dotfiles">Dotfiles</a></li>
            </ol>
        </li>
        <li><a href="#security">Security</a>
            <hr/>
            <ol>
                <li><a href="#failed-login-delay">Failed login delay</a></li>
                <li><a href="#limit-amount-of-processes">Limit amount of processes</a></li>
                <li><a href="#firewall">Firewall</a></li>
                <li><a href="#secure-shell">Secure shell</a></li>
            </ol>
        </li>
        <li><a href="#power-management">Power management</a>
            <hr/>
            <ol>
                <li><a href="#cpu-frequency-scaling">CPU frequency scaling</a></li>
                <li><a href="#hibernate-on-low-battery">Hibernate on low battery</a></li>
                <li><a href="#hibernation">Hibernation</a></li>
            </ol>
        </li>
        <li><a href="#graphical-user-interface">Graphical user interface</a>
            <hr/>
            <ol>
                <li><a href="#display-server">Display server</a></li>
                <li><a href="#compositor">Compositor</a></li>
                <li><a href="#keyboard-layout">Keyboard layout</a></li>
                <li><a href="#display-manager">Display manager</a></li>
                <li><a href="#window-manager">Window manager</a></li>
                <li><a href="#notification-daemon">Notification daemon</a></li>
            </ol>
        </li>
        <li><a href="#multimedia">Multimedia</a>
            <hr/>
            <ol>
                <li><a href="#sound-system">Sound system</a></li>
                <li><a href="#sound-server">Sound server</a></li>
                <li><a href="#mpris">MPRIS</a></li>
                <li><a href="#bluetooth-control">Bluetooth control</a></li>
                <li><a href="#multimedia-applications">Multimedia applications</a></li>
                <li><a href="#image-applications">Image applications</a></li>
            </ol>
        </li>
        <li><a href="#customization">Customization</a>
            <hr/>
            <ol>
                <li><a href="#cursor">Cursor</a></li>
                <li><a href="#gtk">GTK</a></li>
                <li><a href="#qt">QT</a></li>
                <li><a href="#grub">GRUB</a></li>
                <li><a href="#fonts">Fonts</a></li>
            </ol>
        </li>
        <li><a href="#software">Software</a>
            <hr/>
            <ol>
                <li><a href="#compression-tools">Compression tools</a></li>
                <li><a href="#browsers">Browsers</a></li>
                <li><a href="#communication">Communication</a></li>
                <li><a href="#downloads">Downloads</a></li>
                <li><a href="#font-management">Font management</a></li>
                <li><a href="#documents">Documents</a></li>
                <li><a href="#virtualization">Virtualization</a></li>
                <li><a href="#development">Development</a></li>
                <li><a href="#file-management">File management</a></li>
                <li><a href="#others">Others</a></li>
            </ol>
        </li>
        <li><a href="#hardware">Hardware</a>
            <hr/>
            <ol>
                <li><a href="#printer">Printer</a></li>
                <li><a href="#backlight">Backlight</a></li>
                <li><a href="#color-temperature">Color temperature</a></li>
                <li><a href="#battery-state">Battery state</a></li>
            </ol>
        </li>
    </ol>
</details>

## Installer setup

### Keyboard

Change the default layout by first listing all the posibilities:

```console
# localectl list-keymaps
```

Then set the desired keymapping, e.g., `es`:

```console
# loadkeys es
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Font

You can list available fonts with:

```console
# ls /usr/share/kbd/consolefonts/
```

You can temporalily change the font used by the terminal using, e.g., `ter-728n`:

```console
# setfont ter-728n
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Verify boot mode

Run the following to check if the boot mode is correct. Output means: 64 then UEFI in a 64b x64 UEFI, 32 then UEFI in 32b IA32 UEFI, nil then booted in bios.

```console
# cat /sys/firmware/efi/fw_platform_size
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Internet

Ensure the network interface is listed and enabled:

```console
# ip link
```

Make sure the device is not blocked by kernel:

```console
# rfkill
```

Run `iwctl` to configure internet for the installation environment.

List all Wi-Fi devices with,

```console
[iwd]# device list
```

then turn the device or its adapter on if it's not, where `name` is the Wi-Fi device's name

```console
[iwd]# device name set-property Powered on
[iwd]# adapter name set-property Powered on
```

Then scan for networks in the area and output the available networks:

```console
[iwd]# station name scan
[iwd]# station name get-networks
```

Finally, connect to the desired network with its `SSID`

```console
[iwd]# station name connect SSID
```

Finally check Wi-Fi's status

```console
[iwd]# device name show
[iwd]# station name show
```

<p align="right">(<a href="#top">go to top</a>)</p>

### System clock

Synch the system clock and check if its correct

```console
# timedatectl set-ntp true
# timedatectl
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Pacman

Update keyrings to prevent package install failures

```console
# pacman -Sy
# pacman -S --noconfirm archlinux-keyring
```

Enable parallel downloads

```console
# sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
```

Install `reflector` to rank pacman download mirrors

```console
# pacman -S --noconfirm --needed reflector
# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
```

Run reflector with your locational ISO to optimize the servers that will be used

```console
# iso=$(curl -4 ifconfig.co/country-iso)
# reflector -a 48 -c "$iso" -f 5 -l 20 --sort rate --save /etc/pacman.d/mirrorlist
```

<p align="right">(<a href="#top">go to top</a>)</p>

## Disks

### Preparations

List the available disks with the following command and remember the name of the drive that you want to use

```console
# lsblk
```

Then, create the `/mnt` folder to use later

```console
# mkdir /mnt
```

If using a NVMe SSD, change its logical block address size to the optimal one. Change the number in `--lbaf=1` to the best one reported by the previous command.

```console
# nvme id-ns -H /dev/nvme0n1 | grep "Relative Performance"
# nvme format --lbaf=1 /dev/nvme0n1
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Partitioning

With the selected drive's name, create the full name prepending it `/dev/`, e.g., `/dev/nvme0n1`.

Unmount all drives in case any are active:


```console
# umount -A --recursive /mnt
```

Destroy (zap) both GPT and MBR data structures if there are any.

```console
# sgdisk -Z "/dev/nvme0n1"
```

Set the partition alignment to 2048 for the drive

```console
# sgdisk -a 2048 -o "/dev/nvme0n1"
```

Create the following partitions:

1. BIOS boot partition for future proofing, 1 MiB
2. EFI system partition for the bootloader, 2 GiB
3. The linux filesystem partition for root, rest of space

```console
# sgdisk -n 1::+1M -t 1:ef02 -c 1:'BIOSBOOT' "/dev/nvme0n1"
# sgdisk -n 2::+1GiB -t 2:ef00 -c 2:'EFIBOOT' "/dev/nvme0n1"
# sgdisk -n 3::-0 -t 3:8300 -c 3:'ROOT' "/dev/nvme0n1"
```

Inform the OS of partition table changes

```console
# partprobe "/dev/nvme0n1"
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Formating

Format the EFI boot partition with FAT 32.

```console
# mkfs.fat -F 32 -n 'EFIBOOT' "/dev/nvme0n1p2"
```

Format the ROOT partition with Ext4.

```console
# mkfs.ext4 -L 'ROOT' "/dev/nvme0n1p3"
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Mount partitions

Mount the `root` partition into `/mnt`.

```console
# mount -t ext4 /dev/nvme0n1p3 /mnt
```

Mount the `boot` partition into `/mnt/boot`.

```console
# mkdir -p /mnt/boot/efi
# mount -t vfat -L EFIBOOT /mnt/boot
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Swap

Create a swap file.

```console
# mkdir /mnt/swap
# mkswap -U clear --size 8G --file /swap/swapfile
```

Activate the swap file:

```console
# swapon /mnt/swap/swapfile
```

<p align="right">(<a href="#top">go to top</a>)</p>

## Installation

### Initial setup

Install the base packages for arch linux with `pacstrap`

```console
# pacstrap /mnt base base-devel linux linux-firmware linux-headers --noconfirm --needed
```

Add the ubuntu keyserver into pacman if arch's fails to sign in the future

```console
# echo "keyserver hkp://keyserver.ubuntu.com" >> /mnt/etc/pacman.d/gnupg/gpg.conf
```

Copy the previously created mirrorlist into the system

```console
# cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
```

Configure `fstab` running the following

```console
# genfstab -U /mnt >> /mnt/etc/fstab
```

Add an entry for the swap file to `fstab`.

> **GENFSTAB MIGHT HAVE ALREADY DONE THIS, CHECK THE FILE BEFORE DOING SO**

```console
# echo "/swap/swapfile none swap defaults 0 0" >> /mnt/etc/fstab
```

Then, change root into the new system with `arch-chroot`

```console
# arch-chroot /mnt
```

<p align="right">(<a href="#top">go to top</a>)</p>

### File systems

Install the following packages with pacman to support different file systems:

- Btrfs — `btrfs-progs`
- VFAT — `dosfstools`
- exFAT — `exfatprogs`
- ext3, ext4 — `e2fsprogs`
- NTFS — `ntfs-3g`

```console
# pacman -S --noconfirm --needed btrfs-progs dosfstools exfatprogs e2fsprogs ntfs-3g
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Console text editor

Install the following packages to have `neovim` and `nano`.

```console
# pacman -S --noconfirm --needed neovim nano
# echo "EDITOR=nvim" >> /etc/environment
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Time, language and locale

Get your timezone with

```console
# TIMEZONE=$(curl --fail https://ipapi.co/timezone)
```

and set it up with

```console
# ln -s /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
```

Generate `/etc/adjtime`

```console
# hwclock --systohc
```

Setup Network Time Protocol:

```console
# pacman -S --noconfirm --needed ntp
# ntpd -qg
# systemctl enable ntpd.service
```

Edit the `/etc/locale.gen` file and uncomment the locales that will be used

```console
# sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
# sed -i 's/^#es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen
```

and then generate the locales with

```console
# locale-gen
```

Then, edit `/etc/vconsole.conf` to apply the keyboard language, e.g., `es`

```console
# echo "KEYMAP=es" > /etc/vconsole.conf
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Network setup

Install `networkmanager` to have internet access when rebooting

```console
# pacman -S --noconfirm --needed networkmanager dhclient
```

Enable the `NetworkManager` service.

```console
# systemctl enable NetworkManager.service
```

Set the hostname to use editing the `/etc/hostname` file

```console
# echo "ehuniverse" > /etc/hostname
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Pacman setup

Make a backup of the mirrorlist

```console
# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
```

Add parallel downloading

```console
# sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
```

Enable `multilib` by editing `/etc/pacman.conf`

```console
# sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
# pacman -Sy --noconfirm --needed
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Microcode

Install the correct microcode for the processor of the computer. Run the following to get info about the cpu:

```console
# cat /proc/cpuinfo
```

- If Intel &longrightarrow; `intel-ucode`
- If AMD &longrightarrow; `amd-ucode`

```console
# pacman -S --noconfirm --needed ${PKG}
```

Verify the `microcode` hook is in the `/etc/mkinitcpio.conf` file.

<p align="right">(<a href="#top">go to top</a>)</p>

### Graphics drivers

Run the following to get the name of your graphics card

```console
# lspci | grep -E "VGA|3D|Display"
```

For graphics drivers, install the following drivers depending on the output of the previous command.

- NVIDIA / GeForce: `nvidia lib32-nvidia-utils`
- Radeon / AMD: `xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon`
- Integrated Graphics Controller / Intel Corporation UHD: `mesa lib32-mesa vulkan-intel lib32-vulkan-intel`

For hardware video acceleration:

- NVIDIA / GeForce: `nvidia-utils libva-nvidia-driver`
- Radeon / AMD: `libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau libvdpau-va-gl`
- Integrated Graphics Controller / Intel Corporation UHD: `libva-intel-driver libva-utils intel-media-driver libvdpau-va-gl`

```console
# pacman -S --noconfirm --needed ${PKGS}
```

<p align="right">(<a href="#top">go to top</a>)</p>

### User setup

Create a new user with, which will have its default shell set to `bash`, and be added to the following groups:

- `wheel` — Administration group. Access to `journal` and CUPS printer administrations. Also used for `sudo` access.
- `storage` — Access to removable drives.

```console
# useradd -m -G wheel,storage -s /bin/bash ${USER}
```

Set a password to it

```console
# passwd ${USER}
```

Add sudo rights to wheel group

```console
# sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
# sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
```

Set the root password

```console
# passwd
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Initramfs

Update `initramfs` to support extra features modifying the `/etc/mkinitcpio.conf` file and running `mkinitcpio`

```console
# sed -i 's/block/keyboard keymap consolefont block/g' /etc/mkinitcpio.conf
# sed -i 's/autodetect/autodetect microcode/g' /etc/mkinitcpio.conf
# mkinitcpio -P
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Boot loader

Install `grub`, `efibootmgr` and `git`.

```console
# pacman -S --noconfirm --needed grub efibootmgr git
```

First, run `grub-install` with the drive as the argument to install GRUB2 into it.

```console
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```

Enable the `splash` option which enables a graphical splash screen during boot.

```console
# sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*/& splash/' /etc/default/grub
```

Pull a grub theme into the `themes` folder.

```console
# THEME_DIR="/boot/grub/themes/Vimix"
# mkdir -p "${THEME_DIR}"
# cd "${THEME_DIR}" || exit
# git init
# git remote add -f origin https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes.git
# git config core.sparseCheckout true
# echo "themes/Vimix/*" >> .git/info/sparse-checkout
# git pull origin main
# mv themes/Vimix/* .
# rm -rf themes
# rm -rf .git
```

Make a backup of the `grub` default config file and modify the `GRUB_THEME` option to the path of the newly downloaded theme.

```console
# cp -an /etc/default/grub /etc/default/grub.bak
# grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub
# echo "GRUB_THEME=\"${THEME_DIR}/theme.txt\"" >> /etc/default/grub
```

Create the grub config file with the modified options.

```console
# grub-mkconfig -o /boot/grub/grub.cfg
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Documentation

Install the following packages to access documentation pages: `man-db`, `man-pages` and `texinfo`

```console
# pacman -S --noconfirm --needed man-db man-pages texinfo
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Reboot

Reboot to the new system.

```console
# exit
# umount -R /mnt
# reboot
```

<p align="right">(<a href="#top">go to top</a>)</p>

## System booted installation

### Core utils

Install the following core utilities:

```console
# pacman -S --noconfirm --needed bash-completion bat lsd duf dust htop tree xterm xdg-utils wget usbutils
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Post installation

Now that we're booted with systemd as the init system, we can finish configuring the locale and time.

```console
# localectl set-locale LANG="en_US.UTF-8"
```

```console
# TIMEZONE=$(curl --fail https://ipapi.co/timezone)
# timedatectl set-timezone ${TIMEZONE}
# timedatectl set-ntp true
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Network

The `nmcli` command can be used to connect to a WiFi network.

An applet will be used to make connecting to networks easier, `network-manager-applet`, which will autostart with our window manager.

```console
# pacman -S --noconfirm --needed network-manager-applet
```

To store connecton secrets KeePassXC can be used, which implements the Secret Service D-Bus API.

```console
# pacman -S keepassxc
```

To make applications autostart keepassxc when needed, create the following file.

> all users : `/usr/local/share/dbus-1/services/org.freedesktop.secrets.service`
>
> current user : `${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/org.freedesktop.secrets.service`
```ini
[D-BUS Service]
Name=org.freedesktop.secrets
Exec=/usr/bin/keepassxc
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Pacman cache

Install and enable `paccache.timer` to delete all cached versions of installed and uninstalled packages, except for the most recent three.

```console
# pacman -S --noconfirm --needed paccache
# systemctl enable --now paccache.timer
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Pacman mirrors - Reflector

Install `reflector`.

```console
# pacman -S --noconfirm --needed reflector
```

Modify the `/etc/xdg/reflector/reflector.conf` config file to set up `reflector`:

```console
# echo "--save /etc/pacman.d/mirrorlist" > /etc/xdg/reflector/reflector.conf
# echo "--age 48" >> /etc/xdg/reflector/reflector.conf
# iso=$(curl -4 ifconfig.co/country-iso)
# echo "--country $iso" >> /etc/xdg/reflector/reflector.conf
# echo "--fastest 5" >> /etc/xdg/reflector/reflector.conf
# echo "--latest 20" >> /etc/xdg/reflector/reflector.conf
# echo "--protocol https" >> /etc/xdg/reflector/reflector.conf
# echo "--sort rate" >> /etc/xdg/reflector/reflector.conf
```

Then, enable `reflector.timer` to run the command weekly automatically.

```console
# systemctl enable --now reflector.timer
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Numlock on boot

Install the `numlockx` package.

```console
# pacman -S --noconfirm --needed numlockx
```

Create a script to set the numlock on relevant TTYs.

> `/usr/local/bin/numlock`

```bash
#!/bin/bash

for tty in /dev/tty{1..6}
do
    /usr/bin/setleds -D +num < "$tty";
done
```

Make it executable.

```console
# chmod +x /usr/local/bin/numlock
```

Create a systemd service.

> `/etc/systemd/system/numlock.service`
```ini
[Unit]
Description=Enable numlock key on boot

[Service]
ExecStart=/usr/local/bin/numlock
StandardInput=tty
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

Enable the service

```console
# systemctl enable --now numlock.service
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Arch user repository

Install `paru`, which is an AUR helper, making downloads from the AUR easier.

```console
# cd /opt
# git clone https://aur.archlinux.org/paru.git
# chown ${USER}:${USER} paru
# cd paru
# su ${USER}
$ makepkg -sri
```

If a gpg key error occurs, run:

```console
# gpg --recv-key ${INVALID_KEY}
```

<p align="right">(<a href="#top">go to top</a>)</p>

### User directories

Install `xdg-user-dirs` which will automatically enable the `xdg-user-dirs-update.service` user service. Then, run the program to create directories to already existing users.

```console
# pacman -S --needed xdg-user-dirs
# su ${USER}
$ LC_ALL=C.UTF-8 xdg-user-dirs-update --force
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Dotfiles

Get dotfiles from github into the home directory.

```console
$ git clone --bare https://github.com/Josu-A/dotfiles.git $HOME/dotfiles
$ git --git-dir=$HOME/dotfiles config --local status.showUntrackedFiles no
$ git --git-dir=$HOME/dotfiles --work-tree=$HOME checkout -f
```

<p align="right">(<a href="#top">go to top</a>)</p>

## Security

### Failed login delay

Enforce a 4 second delay after a failed login attempt.

```console
# echo "auth optional pam_faildelay.so delay=4000000" >> /etc/pam.d/system-login
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Limit amount of processes

Limit the amount of processes a user can run at once.

```console
# echo "* soft nproc 300" >> /etc/security/limits.conf
# echo "* hard nproc 600" >> /etc/security/limits.conf
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Firewall

To set up a firewall, `iptables` will be used. First, install the necessary packages enable the service:

```console
# pacman -S --noconfirm --needed iptables
```

```console
# systemctl enable --now iptables.service
```

Create two new chains, `TCP` and `UDP`.

```console
# iptables -N TCP
# iptables -N UDP
```

Configure the `FORWARD` chain.

```console
# iptables -P FORWARD DROP -m comment --comment "Reject FORWARD packages, we aren't a router"
```

Configure the `OUTPUT` chain.

```console
# iptables -P OUTPUT ACCEPT
```

Configure the `INPUT` chain.

```console
# iptables -P INPUT DROP -m comment --comment "Reject INPUT packages as default"
# iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT -m comment --comment "Allow traffic that belongs to established connections, or new valid traffic that is related to these connections"
# iptables -A INPUT -i lo -j ACCEPT -m comment --comment "Accept all traffic from the loopback interface"
# iptables -A INPUT -m conntrack --ctstate INVALID -j DROP -m comment --comment "Drop all traffic with an INVALID state match"

# iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT -m comment --comment "Accept all new incoming ICMP echo requests"

# iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP -m comment --comment "Attach the UDP chain to the INPUT chain"
# iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP -m comment --comment "Attach the TCP chain to the INPUT chain"

# iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable -m comment --comment "Reject UDP streams with ICMP port unreachable messages if the ports are not opened"
# iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset -m comment --comment "Reject TCP connections with TCP RESET packets if the ports are not opened"

# iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable -m comment --comment "Reject all remaining incoming traffic with icmp protocol unreachable messages"
```

Configure the `TCP` chain.

```console
# iptables -A TCP -p tcp --dport 80 -j ACCEPT -m comment --comment "Accept web servers"
# iptables -A TCP -p tcp --dport 443 -j ACCEPT -m comment --comment "Accept secure web servers"
# iptables -A TCP -p tcp --dport 22 -j ACCEPT -m comment --comment "Accept ssh connections"
# iptables -A TCP -p tcp --dport 53 -j ACCEPT -m comment --comment "Accept dns server requests"
# iptables -A TCP -p tcp --dport 17500 -j REJECT --reject-with icmp-port-unreachable -m comment --comment "Reject Dropbox LAN sync broadcasts"
```

Configure the `UDP` chain.

```console
# iptables -A UDP -p udp --dport 53 -j ACCEPT -m comment --comment "Accept dns server requests"
```

List the current ruleset with:

```console
# iptables -nvL --line-numbers
```

Finally, to save the changes after reboots execute the following commands.

```console
# iptables-save -f /etc/iptables/iptables.rules
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Secure shell

Install the `openssh` package to log into remote servers securely or create the ssh server itself.

```console
# pacman -S --noconfirm --needed openssh
```

We don't really want to have a server, so the `sshd` service will be disabled.

```console
# systemctl disable --now sshd.service
```

Create a new ssh key using the `ed25519` algorithm.

```console
# ssh-keygen -t ed25519 -C "aginagajosu@gmail.com"
```

Start the `ssh-agent` and add the private key to it:

```console
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519
```

Add the following file to have all future keys automatically added into the agent.

> `~/.ssh/config`
```bash
AddKeysToAgent yes
```

Enable the `ssh-agent` user unit.

```console
$ systemctl --user enable --now ssh-agent.service
```

<p align="right">(<a href="#top">go to top</a>)</p>

## Power management

### CPU frequency scaling

Install `auto-cpufreq` from the AUR.

```console
$ paru -S --noconfirm --needed auto-cpufreq
```

Write its configuration file.

> `/etc/auto-cpufreq.conf`
```ini
[charger]
governor = performance
energy_performance_preference = performance
turbo = auto

[battery]
governor = powersave
energy_performance_preference = power
turbo = auto
```

Enable its daemon.

```console
# systemctl enable --now auto-cpufreq.service
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Hibernate on low battery

If the battery sends events to udev, add the following rule to hibernate on low battery.

> `/etc/udev/rules.d/99-lowbat.rules`
```ini
# Suspend the system when battery level drops to 5% or lower
SUBSYSTEM=="power_supply", ATTR{status}=="Discharging", ATTR{capacity}=="[0-5]", RUN+="/usr/bin/systemctl hibernate"
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Hibernation

To make hibernation work, a few things must be configured. The `resume` hook must be added to initramfs after the `udev` hook.

```console
# sed -i 's/filesystems/filesystems resume/g' /etc/mkinitcpio.conf
# mkinitcpio -P
```

Since systemd v255 and mkinitcpio v38 when the system is running on UEFI you don't have to manually specify the necessary `resume` and `resume_offset` kernel parameters in grub.

<p align="right">(<a href="#top">go to top</a>)</p>

## Graphical user interface

### Display server

Install Xorg.

```console
# pacman -S --noconfirm --needed xorg-server xorg-xinit
```

You can start the x-session running `startx`, which will look for `~/.xinitrc` to set up, but a display manager will be used instead in our case.

Add a basic config file:

> `~/.xinitrc`
```bash
#!/bin/sh

# Source bash conf file
source ~/.bashrc

# Merge user X resources
[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources

# Start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Execute window manager
exec awesome
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Compositor

A compositor's job is to create an entire sub-tree of the window hierarchy to be rendered to an off-screen buffer. Applications can then use this for their needs: transparency, screen tearing, blur, ...

`picom` compositor will be used.

```console
# pacman -S --noconfirm --needed picom
```

Picom is configured in the following location `~/.config/picom/picom.conf`, which we'll fetch from our dotfiles.

<p align="right">(<a href="#top">go to top</a>)</p>

### Keyboard layout

Xorg doesn't read keyboard layout from `/etc/vconsole.conf`, so a configuration file must be created.

> `/etc/X11/xorg.conf.d/00-keyboard.conf`
```conf
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbLayout" "es"
    Option "XkbVariant" "qwerty"
EndSection
```

Or, run the following command to create the file automatically:

```console
# localectl --no-convert set-x11-keymap es qwerty
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Display manager

We'll install `LightDM` as our login screen manager.

```console
# pacman -S --noconfirm --needed lightdm
```

We'll choose `lightdm-webkit2-greeter` as our greeter, and `lightdm-webkit-theme-litarvan` will be used as theme.

```console
# pacman -S --noconfirm --needed lightdm-webkit2-greeter lightdm-webkit-theme-litarvan
```

Enable the lightdm service.

```console
# systemctl enable lightdm.service
```

Modify lightdm's configuration to use our greeter, and enable numlock within it.

> `/etc/lightdm/lightdm.conf`
```ini
[Seat:*]
greeter-session = lightdm-webkit2-greeter
greeter-setup-script = /usr/bin/numlockx on
```

Modify the greeter's configuration file.

> `/etc/lightdm/lightdm-webkit2-greeter.conf`
```ini
#
# [greeter]
# debug_mode          = Greeter theme debug mode.
# detect_theme_errors = Provide an option to load a fallback theme when theme errors are detected.
# screensaver_timeout = Blank the screen after this many seconds of inactivity.
# secure_mode         = Don't allow themes to make remote http requests.
# time_format         = A moment.js format string so the greeter can generate localized time for display.
# time_language       = Language to use when displaying the time or "auto" to use the system's language.
# webkit_theme        = Webkit theme to use.
#
# NOTE: See moment.js documentation for format string options: http://momentjs.com/docs/#/displaying/format/
#

[greeter]
debug_mode          = false
detect_theme_errors = true
screensaver_timeout = 300
secure_mode         = true
time_format         = LT
time_language       = auto
webkit_theme = litarvan

#
# [branding]
# background_images = Path to directory that contains background images for use by themes.
# logo              = Path to logo image for use by greeter themes.
# user_image        = Default user image/avatar. This is used by themes for users that have no .face image.
#
# NOTE: Paths must be accessible to the lightdm system user account (so they cannot be anywhere in /home)
#

[branding]
background_images = /usr/share/backgrounds
logo              = /usr/share/pixmaps/archlinux-logo.svg
user_image        = /usr/share/pixmaps/archlinux-user.svg
```

Now, we'll install a session locker.

Add a background image into the `/usr/share/backgrounds` folder.

```console
# pacman -S --noconfirm --needed light-locker
```

This will lock our session when different udev events happen, or can be manually triggered running `light-locker-command -l`. This requires the `light-locker` program to be running, which launches with the XDG autostart specification.

<p align="right">(<a href="#top">go to top</a>)</p>

### Window manager

We'll install `AwesomeWM`, and `alacritty` will be chosen as the terminal emulator.

```console
# pacman -S --noconfirm --needed awesome alacritty
```

Our custom awesomewm config uses:

- `ttf-dejavu` font used by gtk and qt, `noto-fonts` font used by the window manager and terminal.
- `awesome-wm-widget` repo, which uses the `arc-icon-theme` icons.
- `dex`, to implement the XDG autostart policy.

```console
# cd ~/.config/awesome/
# git clone https://github.com/streetturtle/awesome-wm-widgets.git
# pacman -S --noconfirm --needed ttf-dejavu noto-fonts noto-fonts-cjk noto-fonts-emoji
$ paru -S --noconfirm --needed nerd-fonts-noto-sans-mono
# pacman -S --noconfirm --needed arc-icon-theme
# pacman -S --noconfirm --needed dex
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Notification daemon

AwesomeWM already includes one.

<p align="right">(<a href="#top">go to top</a>)</p>

## Multimedia

### Sound system

`ALSA` is used to provide kernel driven sound card drivers. It bundles a user space driven library for application developers. This enables direct interaction with sound devices through ALSA libraries.

Alsa is installed by default, but `alsa-utils` can be installed, which provides tools such as `alsamixer` and `amixer`. Extra firmware, might need to be installed.

```console
# pacman -S --noconfirm --needed alsa-utils sof-firmware alsa-firmware
```

Unmute the sound card.

```console
# amixer sset Master unmute
# amixer sset Speaker unmute
# amixer sset Headphone unmute
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Sound server

`Pipewire` is a low-level multimedia framework, which offers capture and playback for both audio and video with minimal latency, supporting *Pulseaudio*, *JACK*, *ALSA* and *GStreamer*.

```console
# pacman -S --noconfirm --needed pipewire lib32-pipewire pipewire-docs wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack
```

Configure wireplumber to avoid node suspension when inactive, which could cause audio delays and pops.

> `/etc/wireplumber/wireplumber.conf.d/51-disable-suspension.conf`
```toml
monitor.alsa.rules = [
  {
    matches = [
      {
        # Matches all sources
        node.name = "~alsa_input.*"
      },
      {
        # Matches all sinks
        node.name = "~alsa_output.*"
      }
    ]
    actions = {
      update-props = {
        session.suspend-timeout-seconds = 0
      }
    }
  }
]
# bluetooth devices
monitor.bluez.rules = [
  {
    matches = [
      {
        # Matches all sources
        node.name = "~bluez_input.*"
      },
      {
        # Matches all sinks
        node.name = "~bluez_output.*"
      }
    ]
    actions = {
      update-props = {
        session.suspend-timeout-seconds = 0
      }
    }
  }
]
```

Restart the `pipewire` and `wireplumber` user services.

```console
# systemctl --user restart pipewire.service
# systemctl --user restart wireplumber.service
```

<p align="right">(<a href="#top">go to top</a>)</p>

### MPRIS

MPRIS is a standard D-Bus interface which provides an API for media player control.

Install the `playerctl` control utility.

```console
# pacman -S --noconfirm --needed playerctl
```

Create a service to automatically enable its deamon.

> `~/.config/systemd/user/playerctld.service`
```ini
[Unit]
Description=Keep track of media player activity

[Service]
Type=oneshot
ExecStart=/usr/bin/playerctld daemon

[Install]
WantedBy=default.target
```

Enable the user unit:

```console
# systemctl daemon-reload
$ systemctl --user --now enable playerctld.service
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Bluetooth control

Media control from bluetooth headsets and similar devices may be forwarded to MPRIS. Install `bluez-utils` for it.

```console
# pacman -S --noconfirm --needed bluez-utils
```

Create a service to automatically enable its deamon.

> `~/.config/systemd/user/mpris-proxy.service`
```ini
[Unit]
Description=Forward bluetooth media controls to MPRIS

[Service]
Type=simple
ExecStart=/usr/bin/mpris-proxy

[Install]
WantedBy=default.target
```

Enable the user unit.

```console
# systemctl daemon-reload
$ systemctl --user --now enable mpris-proxy.service
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Multimedia applications

Install the following programs:

- `ffmpeg`: multimedia proccessing.
- `audacity`: audio editing.
- `easyeffects`: equalizing.
- `mpv` and `vlc`: multimedia playback.
- `handbrake`: video size reducer.
- `obs-studio`: video recorder and broadcasting.
- `ani-cli-git`: anime watching CLI tool.
- `davinci-resolve`: video editing software.
- `mangal-bin`: manga downloading CLI tool.

```console
# pacman -S --noconfirm --needed ffmpeg audacity easyeffects mpv vlc handbrake obs-studio
$ paru -S --noconfirm --needed ani-cli-git davinci-resolve mangal-bin
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Image applications

Install the following programs:

- `blender`: 3D modelling tool
- `nsxiv`: simple image viewer.
- `imagemagick`: image modification CML tool.
- `oxipng`: lossless png compressor.
- `gimp`: image editor.
- `inkscape`: vector image editor.
- `flameshot`: screenshot utility.
- `xcolor`: CLI color picker.
- `gpick`: GUI color picker.

```console
# pacman -S --noconfirm --needed blender nsxiv imagemagick oxipng gimp inkscape flameshot xcolor gpick
```

<p align="right">(<a href="#top">go to top</a>)</p>

## Customization

### Cursor

The cursor theme `bibata-cursor-theme` will be installed and used.

```console
$ paru -S --noconfirm --needed bibata-cursor-theme
```

<p align="right">(<a href="#top">go to top</a>)</p>

### GTK

A lot of GTK versions exist. Active versions are `gtk2`, `gtk3` and `gtk4`; `gtk1` is deprecated. Install the current versions. Deprecated one is in the AUR.

```console
# pacman -S --noconfirm --needed gtk2 gtk3 gtk4
```

To modify the themes the file `$XDG_CONFIG_HOME/gtk-2.0/settings.ini` for GTK2, `$XDG_CONFIG_HOME/gtk-3.0/settings.ini` for GTK3 and `$XDG_CONFIG_HOME/gtk-4.0/settings.ini` for GTK4 can be manually altered. If the theme is not applied for GTK3, execute the following commands:

```console
$ gsettings set org.gnome.desktop.interface gtk-theme theme_name
$ gsettings set org.gnome.desktop.interface icon-theme icon_theme_name
```

The `breeze-gtk` theme will be installed for GTK based applications to use.

```console
# pacman -S --noconfirm --needed breeze-gtk
```

Dark theme is enabled by setting the following option in `gtk3`:

```ini
gtk-application-prefer-dark-theme = true
```

and by running the following command in `gtk4`:

```console
# gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

To make the themeing for all users, make symbolic links with the GTK theme configuration files.

```console
# ln -s ~/.gtkrc-2.0 /etc/gtk-2.0/gtkrc
# ln -s ~/.config/gtk-3.0/settings.ini /etc/gtk-3.0/settings.ini
# ln -s ~/.config/gtk-4.0/settings.ini /etc/gtk-4.0/settings.ini
```

<p align="right">(<a href="#top">go to top</a>)</p>

### QT

A lot of QT versions exist. Active versions are `qt5` and `qt6`, while `qt4` and `qt3` are deprecated. Install the current versions from the repo, which a lot of programs might use. Deprecated versions are in the AUR.

```console
# pacman -S --noconfirm --needed qt5-base qt5-svg qt5-doc qt6-base qt6-doc
```

Install the `qt5ct` and `qt6ct` QT configuration tools to modify the themes.

```console
# pacman -S --noconfirm --needed qt5ct qt6ct
```

Set the following environment variable so that QT applications use the `qt5ct`/`qt6ct` configurations.

```console
# echo 'QT_QPA_PLATFORMTHEME=qt5ct:qt6ct' >> /etc/environment
```

The `breeze` theme will be installed for QT based applications to use.

```console
# pacman -S --noconfirm --needed breeze
```

To make apps using qt5.6 and later respect the default dpi, set the following environment variables.

```console
# echo 'QT_AUTO_SCREEN_SCALE_FACTOR=1' >> /etc/environment
# echo 'QT_ENABLE_HIGHDPI_SCALING=1' >> /etc/environment
```

To make the themeing for all users, make symbolic links with the Qt theme configuration files.

```console
???
```

<p align="right">(<a href="#top">go to top</a>)</p>

### GRUB

Install `grub-customizer`.

<p align="right">(<a href="#top">go to top</a>)</p>

### Fonts

- **Bitmap**: `dina-font` `tamsyn-font` `terminus-font`
- **Latinscript**
    - *Families*: `ttf-droid`, `ttf-liberation`, `libertinus-font`, `noto-fonts`, `ttf-roboto`, `ttf-ubuntu-font-family`, `ttf-junicode`
    - *Monospaced*: `ttf-anonymous-pro`, `ttf-cascadia-code`, `otf-fantasque-sans-mono`, `otf-fira-mono`, `ttf-hack`, `otf-hermit`, `ttf-inconsolata`, `ttc-iosevka`, `ttf-jetbrains-mono`, `adobe-source-code-pro-fonts`,
    - *Sans-serif*: `otf-fira-sans`, `inter-font`, `ttf-opensans`, `adobe-source-sans-fonts`
    - *Serif*: `otf-crimson`, `gentium-plus-font`
- **Chinese**, **Japanese**, **Korean**, **Indic** *script*: `adobe-source-han-sans-otc-fonts`, `adobe-source-han-serif-otc-fonts`, `noto-fonts-cjk`, `ttf-indic-otf`
- **Emoji and symbols**: `noto-fonts-emoji`, `ttf-joypixels`, `gnu-free-fonts`, `ttf-arphic-uming`
- **Math**: `otf-latin-modern`, `otf-latinmodern-math`

`$XDG_CONFIG_HOME/fontconfig/fonts.conf`

`/etc/fonts/local.conf`

<p align="right">(<a href="#top">go to top</a>)</p>

## Software

### Compression tools

The following packages can be installed to work with different archives.

- `tar`: archives files into a single `.tar` file.
- `gzip`: compresses a file into a `.gz` file.
- `p7zip`: works with the `.7z` files.
- `unrar`: uncompresses `.rar` files.
- `zip`: compresses files into a single `.zip` file.
- `unzip`: uncompresses files from a `.zip` file.
- `innoextract`: extracts installers from a `.exe` file.

```console
# pacman -S --noconfirm --needed tar gzip p7zip unrar zip unzip innoextract
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Browsers

Install web browsers with:

- `firefox`: open-source browser.

```console
# pacman -S --noconfirm --needed firefox
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Communication

Install communication tools with:

- `discord`: text and voice chat communication tool.
- `thunderbird`: email client.

```console
# pacman -S --noconfirm --needed discord thunderbird
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Downloads

Install downloads utilities.

- `yt-dlp`: youtube CLI downloader.
- `qbittorrent`: torret client.

```console
# pacman -S --noconfirm --needed yt-dlp qbittorrent
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Font management

Install the following applications to manage fonts:

- `fontforge`: font editing application.
- `font-manager`: GTK based font manager.
- `gucharmap`: GTK based unicode charmap.

```console
# pacman -S --noconfirm --needed fontforge font-manager gucharmap
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Documents

Install the following applications to write, view and edit documents:

- `libreoffice-fresh`: open source office suite.
- `texlive`: LaTeX typewritting packages.
- `pdftk`: CLI `.pdf` editor.
- `qpdfview`: tabbed `.pdf` viewer.

```console
# pacman -S --noconfirm --needed libreoffice-fresh texlive pdftk
$ paru -S --noconfirm --needed qpdfview
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Virtualization

Install the following applications to virtualize applications:

- `virtualbox`: GUI based virtual machine manager.
- `virtualbox-host-modules-arch`: required by `virtualbox` for some utilities.
- `virtualbox-guest-iso`: required by `virtualbox` for some utilities.

```console
# pacman -S --noconfirm --needed virtualbox virtualbox-host-modules-arch virtualbox-guest-iso
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Development

Install the following packages to develop software:

- `npm`: node package manager.
- `nodejs`: NodeJS execution environment.
- `cmake`: C++ building tool.
- `go`: Go compiler.
- `eclipse-java-bin`: IDE for java.
- `visual-studio-code-bin`: general IDE.
- `geogebra`: interactive geometry, algebra, statistics and calculus application.
- `notepadqq`: Notepad++-like text editor with support for syntax highlighting.
- `qxmledit`: simple Qt XML editor and XSD viewer.


```console
# pacman -S --noconfirm --needed npm nodejs cmake geogebra notepadqq qxmledit
$ paru -S --noconfirm --needed eclipse-java-bin visual-studio-code-bin
```

<p align="right">(<a href="#top">go to top</a>)</p>

### File management

The following two file managers will be installed:

- `nemo`: GTK based file manager.
- `lf`: CLI based file manager, with previews.

On top of that, `trash-cli` will be installed and can be used as a replacement to `rm` while implementing the FreeDesktop trash specification. Provides the following commands: `trash-put`, `trash-restore`, `trash-list`,`trash-empty` and `trash-rm`.

```console
# pacman -S --noconfirm --needed nemo lf trash-cli
```

Create a user unit that will be called by a user timer, which will delete trashed files older than specified.

> `~/.config/systemd/user/trash-cleanup.service`
```ini
[Unit]
Description=Clean trashed files older than 30 days

[Service]
Type=oneshot
ExecStart=/usr/bin/trash-empty 30
```

Then, create the timer.

> `~/.config/systemd/user/trash-cleanup.timer`
```ini
[Unit]
Description=Queue trash cleanup daily

[Timer]
OnCalendar=daily
Persistent=true
RandomizedDelaySec=1h

[Install]
WantedBy=timers.target
```

Finally, enable the timer.

```console
$ systemctl enable --user --now trash-cleanup.timer
```

To have user services run at boot instead of login, we can enable lingering for a particular user.

```console
# loginctl enable-linger ${USER}
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Others

```console
# pacman -S --noconfirm --needed \
> units translate-shell lorem \
> fastfetch hwinfo lm_sensors \
> xfce4-taskmanager systemd-ui qalculate-qt \
> barrier
```

<p align="right">(<a href="#top">go to top</a>)</p>

## Hardware

### Printer

#### Cups

The communication between the printer and the computer is done with `CUPS`. Install the `cups` and the `cups-pdf` packages. For non-PDF printers, install `ghostscript` and `gsfonts` too.

```console
# pacman -S --noconfirm --needed cups cups-pdf ghostscript gsfonts
```

Then, enable cups's socket, which will enable the cups service every time an application requests it, instead of having the service always running.

```console
# systemctl enable --now cups.socket
```

#### Foomatic

To use `foomatic`, which provides PPDs for many printer drivers, install the following packages.

```console
# pacman -S --noconfirm --needed foomatic-db-engine foomatic-db-ppds foomatic-db-nonfree-ppds
```

#### Connection

If connected via USB, check if the printer is detected with `lsusb`.


#### Configuration

Simplest way of using cups is to install `system-config-printer`, which is a GUI that helps us configure the desired printer.

```console
# pacman -S --noconfirm --needed system-config-printer
```

To be able to print without having to input the root password every time, add the user to the `cups` group, or `lp` group if cups version is below 2.2.6-2.

```console
# usermod -aG cups ${USER}
# usermod -aG lp ${USER}
```

Set the default paper size to `a4` (default is `letter`, disgusting).

```console
# echo A4 >> /etc/papersize
```

#### Firewall

Modify the firewall so that no issues arise.

```console
# iptables -A TCP -p tcp --dport 631 -j ACCEPT -m comment --comment "Internet Printing Protocol requests and responses (print jobs, status monitoring, etc.)"
# iptables -A UDP -p udp --dport 5353 -j ACCEPT -m comment --comment "Multicast DNS lookups and service registrations"
# iptables -A UDP -p udp --dport 137 -j ACCEPT -m comment --comment "Windows Internet Naming Service (name lookup for SMB printing)"
# iptables -A TCP -p tcp --dport 139 -j ACCEPT -m comment --comment "Windows SMB printing"
# iptables -A TCP -p tcp --dport 445 -j ACCEPT -m comment --comment "Windows SMB Domain Server (authenticated SMB printing)"
# iptables-save -f /etc/iptables/iptables.rules
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Backlight

The `light` package will be used to increase and decrease the brightness of the screen. Available devices can be listed with `light -L`.

```console
# pacman -S --noconfirm --needed light
```

Add the user to the `video` group:

```console
# usermod -aG video ${USER}
```

Set the minimum brightness of the screen to avoid going blank.

```console
# light -N 1
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Color temperature

The `redshift` package can be used to adjust the temperature of the colors displayed on screen.

```console
# pacman -S redshift
```

<p align="right">(<a href="#top">go to top</a>)</p>

### Battery state

Install the `acpi` package, which can be used to obtain information about ACPI devices.

```console
# pacman -S acpi
```

Our window manager will use this to display battery levels.

<p align="right">(<a href="#top">go to top</a>)</p>
