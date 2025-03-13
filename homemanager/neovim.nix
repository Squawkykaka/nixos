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
      pkgs.vimPlugins.coq_nvim
      pkgs.vimPlugins.oil-nvim
      pkgs.vimPlugins.coc-highlight
    ];
  };

  # programs.nixvim = {
  #   enable = true;

  #   vimAlias = true;
  #   defaultEditor = true;

  #   colorschemes.catppuccin.enable = true;
  #   plugins.lualine.enable = true;

  #   plugins.nvim-tree.view.relativenumber = true;

  #   # plugins = [
  #   #   pkgs.vimPlugins.render-markdown-nvim
  #   #   pkgs.vimPlugins.nvim-treesitter.withAllGrammars
  #   #   pkgs.vimPlugins.coq_nvim
  #   #   pkgs.vimPlugins.oil-nvim
  #   # ];
  # };
}