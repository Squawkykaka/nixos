{
  lib,
  pkgs,
  config,
  ...
}: {
  boot.blacklistedKernelModules = [ "thunderbolt" ];
}