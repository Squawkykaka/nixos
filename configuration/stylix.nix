{ config, pkgs, ... }:
{
  # stylix
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  stylix.image = ./image.png;

  # cursor
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibita-Modern-Ice";
}