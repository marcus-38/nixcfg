{
  description = "NixOS Configuration";

  inputs = let
    username = "fet";
  in {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix.url = "github:helix-editor/helix/master";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, username, ... }: {
    nixosConfigurations = {
      ghost = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	      specialArgs = { inherit inputs; };
	      modules = [
	        ./hosts/ghost
          ./features/clean.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home-manager/${username}.nix;
          }
	      ];
      };
    };
  };
}
