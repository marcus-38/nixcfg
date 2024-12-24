
# List available commands
default:
    @just --list

# Deploy remote machine
deploy MACHINE IP='':
    #!/usr/bin/env sh
    if [ {{MACHINE}} = "macos" ]; then
       darwin-rebuild switch --flake .
    elif [ -z "{{IP}}" ]; then
       sudo nixos-rebuild switch --fast --flake ".#{{MACHINE}}"
    else
       nixos-rebuild switch --fast --flake ".#{{MACHINE}}" --use-remote-sudo --target-host "fet@{{IP}}" --build-host "fet@{{IP}}"
    fi

# Update flake
update:
    nix flake update

# Commit and push changes
commit MESSAGE:
    git add .
    git commit -m "{{MESSAGE}}"
    git push

# Update, commit, and push changes
update-and-commit MESSAGE: update
    @just commit "{{MESSAGE}}"

# Deploy, update, commit, and push changes
deploy-update-commit SYSTEM MESSAGE: (deploy SYSTEM) update
    @just commit "{{MESSAGE}}"

# Check flake
check:
    nix flake check

# Show flake info
show:
    nix flake show

# Build system configuration
build SYSTEM:
    nixos-rebuild build --flake .#{{SYSTEM}}

# Enter a development shell
dev-shell:
    nix develop
