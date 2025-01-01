default:
	@just --list

deploy:
	nixos-rebuild switch --flake . --use-remote-sudo

debug:
	nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose 

up:
	nix flake update

# update specific input, usage: just upp i=home-manager
upp:
	nix flake update $(i)

history:
	nix profile history --profile /nix/var/nix/profiles/system

repl:
	nix repl -f flake:nixpkgs

# removes profiles older than 7 days
clean:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d

gc:
	sudo nix-collect-garbage --delete-old

check:
	@nix flake check

rebuild HOST:
	@sudo nixos-rebuild switch --upgrade --flake .#{{HOST}}

up-all HOST:
	@nix flake update
	@nix flake update home-manager
	@sudo nixos-rebuild switch --recreate-lock-file --flake .#{{HOST}}


### Git
commit MESSAGE:
	git add .
	git commit -m "{{MESSAGE}}"
	git push
