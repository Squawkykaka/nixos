# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./configuration/plymouth.nix
      ./configuration/stylix.nix
      ./configuration/users.nix
      ./configuration/drivers/nvidia.nix
      ./configuration/drivers/bootfix.nix
      ./configuration/clean.nix
      # ./configuration/virtualisation.nix
      ./configuration/apps/steam.nix
      ./configuration/apps/flatpak.nix
      ./configuration/polkit.nix

      ./configuration/distributed-builds.nix
    ];

  # set ozone variable, disabled as it causes electron apps to take 2 mins to launch
#  environment.variables.NIXOS_OZONE_WL = "1";

  # delete the homemanager backup files
  system.userActivationScripts = {
  removeConflictingFiles = {
      text = ''
        find ~ -type f -name "*.rebuild" -delete
      '';
    };
  };

  # needed for logseq to work
  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
  ];

  # hyprland cache
  nix.settings = {
    substituters = ["https://hyprland.cachix.org" "https://nix-community.cachix.org"];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="      
      ];
  };

  # enable hyprland
  programs.hyprland.enable = true;

  # set kernal, the canTouchEfiVariables option is maybe not required
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable networking
  networking.hostName = "nix-squawkykaka"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.enableIPv6  = false;

  # Set your time zone.
  time.timeZone = "Pacific/Auckland";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_NZ.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NZ.UTF-8";
    LC_IDENTIFICATION = "en_NZ.UTF-8";
    LC_MEASUREMENT = "en_NZ.UTF-8";
    LC_MONETARY = "en_NZ.UTF-8";
    LC_NAME = "en_NZ.UTF-8";
    LC_NUMERIC = "en_NZ.UTF-8";
    LC_PAPER = "en_NZ.UTF-8";
    LC_TELEPHONE = "en_NZ.UTF-8";
    LC_TIME = "en_NZ.UTF-8";
  };

  # enable autocpufreq
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = true;

  # Enable SDDM.
  services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.package = pkgs.kdePackages.sddm;
  services.displayManager.sddm.wayland.enable = true;
  # services.displayManager.sddm.theme = "${pkgs.catppuccin-sddm}/share/sddm/themes/catppuccin-mocha";

  # Enable sound with pipewire.

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # enable zsh and tailscale
  programs.zsh.enable = true;
  services.tailscale.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gleask = {
    isNormalUser = true;
    description = "George Leask";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable flakes and import packages
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; import ./packages.nix { inherit pkgs; };
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
