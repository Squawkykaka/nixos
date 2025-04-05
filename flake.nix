{
  description = "flake for nix-squawkykaka with Home Manager enabled";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";  
    catppuccin.url = "github:catppuccin/nix";
    stylix.url = "github:danth/stylix/release-24.11";

    home-manager = {
        url = "github:nix-community/home-manager/release-24.11";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add logitechg support
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz"; # For latest stable version
      #url = "https://flakehub.com/f/Svenum/Solaar-Flake/0.1.1.tar.gz"; # uncomment line for solaar version 1.1.13
      #url = "github:Svenum/Solaar-Flake/main"; # Uncomment line for latest unstable version
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
  };
  outputs = {
    self,
    nixpkgs,
    catppuccin,
    stylix,
    nixos-hardware,
    home-manager,
    solaar,
    lanzaboote,
    determinate,
    ...
  }: {
    nixosConfigurations = {
      nix-squawkykaka = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./configuration.nix
          catppuccin.nixosModules.catppuccin
          stylix.nixosModules.stylix
          solaar.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
          determinate.nixosModules.default
          ({ pkgs, lib, ... }: {

            environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
              pkgs.sbctl
            ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/etc/secureboot";
            };
          })
        ];
      };
    };
  };
}
