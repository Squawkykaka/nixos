{ config, pkgs, ... }:
{
  # stylix
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
  stylix.image = ../image.png;

  # cursor
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 32;

  # monospace font
  stylix.fonts.monospace.package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
  stylix.fonts.monospace.name = "JetBrainsMono";
}