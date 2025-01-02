{
  description = "NixOS Configuration";

  inputs =  {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix.url = "github:helix-editor/helix/master";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    user = "fet";
    system = "x86_64-linux";
    locale = "sv_SE.UTF-8";
  in {
    nixosConfigurations = {
      ghost = nixpkgs.lib.nixosSystem {
        system = "${system}";
	      specialArgs = { inherit inputs user system locale; };
	      modules = [
	        ./hosts/ghost
          ./features/clean.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = import ./home-manager/${user}.nix;
          }
	      ];
      };
    };
  };
}
