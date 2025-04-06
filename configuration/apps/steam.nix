{ config, pkgs, ... }:
{
  # Enable opengl
  hardware.graphics = {
     enable = true;
     enable32Bit = true;
  };

  # Install steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.steam.remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  programs.steam.dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  
  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/gleask/.steam/root/compatibilitytools.d";
  };


}