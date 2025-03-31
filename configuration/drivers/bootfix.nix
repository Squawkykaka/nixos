{
  lib,
  pkgs,
  config,
  ...
}: {
  boot.blacklistedKernelModules = [ "thunderbolt" ];

  # remove the slow network manager wait-online service
  systemd.services.NetworkManager-wait-online.enable = false;
}