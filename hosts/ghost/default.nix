{ pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
  ];

  networking = {
    hostName = "ghsot";
  };

  system.stateVersion = "24.05";
}
