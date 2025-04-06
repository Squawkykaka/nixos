{ pkgs, ... }:
with pkgs; [
btop
bitwarden-desktop
oh-my-zsh
vscodium
obsidian
killall
firefox
webcord
openssh
xsettingsd
jetbrains.idea-ultimate
xpipe
ripgrep
tree-sitter
(writeShellScriptBin "pakku" ''
  ${jre}/bin/java -jar /home/gleask/pakku.jar $@
'')

socat

waybar
wofi
swww
pavucontrol
xdg-desktop-portal-hyprland
xdg-desktop-portal-gtk
wlogout
networkmanagerapplet

r2modman
logseq
obs-studio
mangohud
protonup

(lutris.override {
  extraPkgs = pkgs: [
    wineWowPackages.stable
    gamescope
  ];
})
winetricks

at-spi2-core
]
