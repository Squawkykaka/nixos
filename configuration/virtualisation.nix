{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "intel_iommu=on" "pcie_aspm=off" ];
  boot.kernelModules = [ "kvm-intel" ];

  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 gleask qemu-libvirtd -"
    "f /dev/shm/looking-glass 0660 gleask libvirtd -"
  ];
}