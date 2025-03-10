{ config, pkgs, ... }:

{
  virtualisation.kvmfr = {
    enable = true;

    shm = {
      enable = true;

      size = 128;
      user = "j-brn";
      group = "libvirtd";
      mode = "0600";
    };
  };
}