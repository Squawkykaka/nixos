{ config, pkgs, system, inputs, ... }:

{
  home.username = "gleask";
  home.homeDirectory = "/home/gleask";

  catppuccin.ghostty.enable = true;

  home.packages = with pkgs; [
    zip
    unzip
    prismlauncher
  ];

  programs.git = {
    enable = true;
    userName = "Squawkykaka";
    userEmail = "squawkykaka@gmail.com";
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "catppuccin-frappe";
    };
  };
  home.stateVersion = "24.11";
}
