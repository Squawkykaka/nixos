{ config, pkgs, system, inputs, ... }:

{
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
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
   history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "battery" "thefuck" ];
      theme = "robbyrussell";
    };
  };
  home.stateVersion = "24.11";
}
