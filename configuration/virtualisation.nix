{ config, pkgs, ... }:
{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["gleask"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}