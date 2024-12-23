{
	description = "My personal NixOS and Nixpkgs config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		impermanence.url = "github:nix-community/impermanence";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		sops-nix = {
			url = "github:Mic92/sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixarr = {
			url = "github:rasmus-kirk/nixarr";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nix-darwin = {
			url = "github:LnL7/nix-darwin";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nix-homebrew = {
			url = "github:zhaofengli-wip/nix-homebrew";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		homebrew-bundle = {
			url = "github:homebrew/homebrew-bundle";
			flake = false;
		};

		homebrew-core = {
			url = "github:homebrew/homebrew-core";
			flake = false;
		};

		homebrew-cask = {
			url "github:homebrew/homebrew-cask";
			flake = false;
		};

		nixos-wsl = {
			url = "github:nix-community/NixOS-WSL/main";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {
		self,
		nixpkgs,
		nix-darwin,
		...
	} @ inputs: let
		inherit (self) outputs;

		systems = [
			"x86_64-linux"
			"aarch64-darwin"
		};

		forAllSystems = nixpkgs.lib.genAttrs systems;
	in {
		formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

		nixosConfigurations = {
			myling = nix-darwin.lib.darwinSystem {
				specialArgs = {inherit inputs outpus;};
				modules = [./machines/myling/configuration.nix];
			};

			nixos-testing = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs outputs;};
				modules = [./machines/nixos-testing/configuration.nix];
			};

			ghost = nixpkgs.lib.nixosSystem {
				specialArgs = {inherit inputs outputs;];
				modules = [./machines/ghost/configuration.nix];
			};
		};
	};
}
			
