{ pkgs, ... }:
with pkgs; [
btop
docker
_1password-gui
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

mangohud
protonup-qt
protonup
lutris
bottles

wineWowPackages.full
]
