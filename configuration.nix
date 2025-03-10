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
    ];

  # delete those annoying files
  system.userActivationScripts = {
  removeConflictingFiles = {
      text = ''
        find ~ -type f -name "*.rebuild" -delete
      '';
    };
  };

  # virtualisation
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["gleask"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # zsh
  programs.zsh.enable = true;
  # Enable opengl
  hardware.graphics = {
     enable = true;
     enable32Bit = true;
  };

  # enable nvidia gpu support
  hardware.nvidia.open = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.modesetting.enable = true;

  # enable prime offloading
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true; # Lets you use `nvidia-offload %command%` in steam
    };
    
    intelBusId = "PCI:00:02:0";
    nvidiaBusId = "PCI:01:00:0";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.hostName = "nix-squawkykaka"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

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

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;
  
  # enable autocpufreq
  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

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

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # set shell to zsh
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gleask = {
    isNormalUser = true;
    description = "George Leask";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Install steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/gleask/.steam/root/compatibilitytools.d";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
