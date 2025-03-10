{ config, pkgs, system, inputs, ... }:

{
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
}