{ pkgs, ... }:
{
  nix.distributedBuilds = false;
  nix.settings.builders-use-substitutes = true;

  nix.buildMachines = [
    {
      hostName = "100.64.0.6";
      sshUser = "remotebuild";
      sshKey = "/root/.ssh/remotebuild";
      system = pkgs.stdenv.hostPlatform.system;
      supportedFeatures = [ "nixos-test" "big-parallel" "kvm" ];
    }
  ];
}