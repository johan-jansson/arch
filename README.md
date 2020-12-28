# arch-crypto

installation script for arch linux

1. /dev/nvme1n1p1 -> /boot (no encryption)
2. /dev/nvme1n1p2 -> /     (encryption) via /dev/mapper/arch-root
3. username: johan

4. automatically pulls and tracks configuration using repo at github.com/johan-jansson/dot
4.1. config status
4.2. config add <file>
4.3. config commit -ma "updated config"
4.4. config push
