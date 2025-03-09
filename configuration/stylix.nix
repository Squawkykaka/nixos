{ config, pkgs, ... }:
{
  # stylix
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  stylix.image = ../image.png;

  # cursor
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibita-Modern-Ice";
  stylix.cursor.size = 22;

  # monospace font
  stylix.fonts.monospace.package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
  stylix.fonts.monospace.name = "JetBrainsMono";
}