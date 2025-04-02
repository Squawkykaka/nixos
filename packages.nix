{ pkgs, ... }:
with pkgs; [
btop
bitwarden-desktop
oh-my-zsh
vscodium
obsidian
webcord
thefuck
openssh
xsettingsd
libvirt-glib
xpipe
ripgrep
tree-sitter
(writeShellScriptBin "pakku" ''
  ${jre}/bin/java -jar /home/gleask/pakku.jar $@
'')

waybar
wofi
swww

r2modman
logseq
obs-studio
mangohud
protonup-qt
protonup
lutris
bottles

wineWowPackages.full

# XlibsForQt5.plasma-workspace
]
