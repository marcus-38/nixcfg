# nixcfg
NixOS Configuration using Flakes and Home-Manager

# Clone repo and install
1. Clone this repo
```bash
git clone https://github.com/marcus-38/nixcfg
```
2. Enter repo
```bash
cd nixcfg
```
3. Rebuild system
```bash
sudo nixos-rebuild switch --flake .#ghost
```
or use the justfile
```bash
just ghost
```

# Use this config as a source
```bash
sudo nixos-rebuild switch --flake github:marcus-38/nixcfg#ghost
```
