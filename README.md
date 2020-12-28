# arch-crypto

installation script for arch linux

1. /dev/nvme1n1p1 -> /boot (no encryption)
2. /dev/nvme1n1p2 -> /     (encryption) via /dev/mapper/arch-root
3. username: johan

1. automatically pulls and tracks configuration using repo at github.com/johan-jansson/dot
1a. config status
1b. config add <file>
1c. config commit -am "updated config"
1d. config push
