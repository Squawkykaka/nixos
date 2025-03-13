{ pkgs, ... }: {
  boot = {

    plymouth = {
      enable = true;
      theme = "blahaj";
      # themePackages = with pkgs; [
      #   # By default we would install all themes
      #   (plymouth-blahaj-theme.override {
      #     selected_themes = [ "blahaj" ];
      #   })
      # ];

      themePackages = with pkgs; [
        plymouth-blahaj-theme
      ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "intel_iommu=on"
      "pcie_aspm=off"
    ];
    
    kernelModules = [ "kvm-intel" ];

    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;

  };
}
