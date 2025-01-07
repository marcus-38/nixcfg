{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, nvf, ... }: let 
    mysystem = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${mysystem};

    configModule = {
      config.vim = {
        theme.enable = true;
      };
    };

#    customNeovim = nvf.lib.neovimConfiguration {
#      inherit pkgs;
#      modules = [configModule];
#    };

    in {
 #     packages.${mysystem}.my-neovim = customNeovim.neovim; # makes the package available as a flake outupt under packages

      nixosConfigurations.ghost = nixpkgs.lib.nixosSystem {
        system = "${mysystem}";
        modules = [
          ./configuration.nix
          nvf.nixosModules.default
 #         { environment.systemPackages = [ customNeovim.neovim ]; }
        ];
      };
    };
}
