{ pkgs, ... }:
{
  nix.distributedBuilds = false;
  nix.settings.builders-use-substitutes = true;

  nix.buildMachines = [
    {
      hostName = "nixos-builder";
      sshUser = "remotebuild";
      sshKey = "/root/.ssh/remotebuild";
      system = pkgs.stdenv.hostPlatform.system;
      supportedFeatures = [ "nixos-test" "big-parallel" "kvm" ];
    }
  ];
}