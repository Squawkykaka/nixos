{ config, pkgs, system, inputs, ... }:

{
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        update = "nh os switch /etc/nixos";
      };
      
      history.size = 10000;

      initExtra = ''
        # Ensure direnv hook is properly sourced for zsh
        eval "$(direnv hook zsh)"
      '';

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "battery" ];
        theme = "jbergantine";
      };
  };
}