{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.fet = {
    #initialHashedPassword = "$y$j9T$IoChbWGYRh.rKfmm0G86X0$bYgsWqDRkvX.EBzJTX.Z0RsTlwspADpvEF3QErNyCMC";
    password = "12345";
    isNormalUser = true;
    description = "fet";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
      "adbusers"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPZ9UutscZ/rluEVTdtRV8RnbaYKmRXL8fFHQYe0mzMC fet@9310"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.fet =
    import ../../../home/fet/${config.networking.hostName}.nix;
}

