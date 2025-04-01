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
    # nixvim = {
    #   # url = "github:nix-community/nixvim";
    #   # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
    #   url = "github:nix-community/nixvim/nixos-24.11";

    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  outputs = {
    self,
    nixpkgs,
    catppuccin,
    stylix,
    nixos-hardware,
    home-manager,
    solaar,
    ...
  } @ inputs: let 
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nix-squawkykaka = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        modules = [
          ./configuration.nix
          catppuccin.nixosModules.catppuccin
          stylix.nixosModules.stylix
          solaar.nixosModules.default
          # nixvim.nixosModules.nixvim

          nixos-hardware.nixosModules.lenovo-thinkpad-x1-extreme-gen2
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "rebuild";
            home-manager.users.gleask.imports = [
                ./home.nix
                ./homemanager/zsh.nix
                ./homemanager/neovim.nix
                ./homemanager/hyprland.nix

                catppuccin.homeModules.catppuccin
            ];
          }
        ];
      };
    };
  };
}
