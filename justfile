# List all commands.
default:
	@just --list

# Deploy on remote machine.
deploy:
	nixos-rebuild switch --flake . --use-remote-sudo

# Deploy on remote machine with extra verbose output.
debug:
	nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose 

# Update flake lock file.
up:
	nix flake update

# Update specific input, usage: just upp i=home-manager.
upp:
	nix flake update $(i)

# Show profile history.
history:
	nix profile history --profile /nix/var/nix/profiles/system

# Enter a nix repl.
repl:
	nix repl -f flake:nixpkgs

# Removes profiles older than 7 days.
clean:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d

# Garbage collector, deletes old stuff.
gc:
	sudo nix-collect-garbage --delete-old

# Check if flake is ok.
check:
	@nix flake check

# Rebuild HOST (use if you have defined multiple hosts).
rebuild HOST:
	@sudo nixos-rebuild switch --upgrade --flake .#{{HOST}}

# Update flake, home-manager and rebuild.
up-all HOST:
	@nix flake update
	@nix flake update home-manager
	@sudo nixos-rebuild switch --recreate-lock-file --flake .#{{HOST}}

# Add, commit and push files to git with automatic commit message. Rebuilds the ghost system.
ghost:
	git add .
	@nix flake update
	@nix flake update home-manager
	git commit -m "Auto generated commit"
	git push
	@sudo nixos-rebuild switch --recreate-lock-file --flake .#ghost

# Add, commit with MESSAGE and push.
commit MESSAGE:
	git add .
	git commit -m "{{MESSAGE}}"
	git push
