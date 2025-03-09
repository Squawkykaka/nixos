{ config, pkgs, system, inputs, ... }:

{
  imports = [
    ./homemanager/zsh.nix
  ];

  home.username = "gleask";
  home.homeDirectory = "/home/gleask";

  catppuccin.enable = true;

  home.packages = with pkgs; [
#    zen-browser.packages."${system}".specific
    zip
    unzip
    prismlauncher
    mesa-demos
  ];

  programs.git = {
    enable = true;
    userName = "Squawkykaka";
    userEmail = "squawkykaka@gmail.com";
    pull.rebase = true;
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
    };
  };
  home.stateVersion = "24.11";
}
