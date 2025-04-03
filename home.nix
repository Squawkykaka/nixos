{ config, pkgs, system, inputs, ... }:

{
  home.username = "gleask";
  home.homeDirectory = "/home/gleask";

  home.packages = with pkgs; [
    zip
    unzip
    killall
    prismlauncher
    tree
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
      # theme = "ayu";
      # custom-shader = ["~/shaders/bettercrt.glsl" "~/shaders/bloom.glsl"];
    };
  };
  home.stateVersion = "24.11";
}
