{ pkgs, ... }:
with pkgs; [
btop
bitwarden-desktop
oh-my-zsh
vscodium
obsidian
firefox
webcord
openssh
xsettingsd
xpipe
ripgrep
tree-sitter
(writeShellScriptBin "pakku" ''
  ${jre}/bin/java -jar /home/gleask/pakku.jar $@
'')

waybar
wofi
swww
pavucontrol
xdg-desktop-portal-hyprland
xdg-desktop-portal-gtk
wlogout

sddm-astronaut

r2modman
logseq
obs-studio
mangohud
protonup
lutris
]
