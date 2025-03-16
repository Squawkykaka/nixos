{ config, pkgs, ... }:

{ 
  nix = {
    distributedBuilds = true;
    buildMachines = [
      {
        hostName = "nixos-builder";
        system = "x86_64-linux";
        protocol = "ssh";
        maxJobs = 4;  # Adjust based on your system capabilities
        speedFactor = 1;
        supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      }
    ];
  };
}