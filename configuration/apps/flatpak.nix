{ config, pkgs, ... }:
{
  # Enable Flatpak support
  services.flatpak.enable = true;
}