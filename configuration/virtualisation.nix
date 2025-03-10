{ config, pkgs, ... }:

{
  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 gleask qemu-libvirtd -"
    "f /dev/shm/looking-glass 0660 gleask libvirtd -"
  ];
}