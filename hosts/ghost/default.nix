{ pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
  ];

  networking = {
    hostName = "ghsot";
    useDHCP = true;
  };

  system.stateVersion = "24.05";
}
