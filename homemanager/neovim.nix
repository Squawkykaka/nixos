{ config, pkgs, system, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
    extraConfig = ''
      set number relativenumber
    '';

    plugins = [
      pkgs.vimPlugins.render-markdown-nvim
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      pkgs.vimPlugins.statix
      pkgs.vimPlugins.lz-n
      pkgs.vimPlugins.telescope-nvim
    ];
  };
}
