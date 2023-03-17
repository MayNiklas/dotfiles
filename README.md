# my dotfiles managed by home-manager

Contains my dotfiles for non NixOS systems.

## Introduction

Over the last two years, I have been using NixOS together with home-manager to manage my dotfiles.
Since my primary laptop is a MacBook, I have decided to give home manager a try in a seperate repository (simplicity).

## Pre-requisites

- install [Nix](https://nixos.org/download.html)
- enable [Nix Flakes](https://nixos.wiki/wiki/Flakes)

## Commands

```bash
# build /check configuration
nix build .#homeConfigurations.nik.activation-script 

# switch to new configuration
nix run .#homeConfigurations.nik.activationPackage

# basic flake check
nix flake check

# update flake.lock -> updates all flake inputs (e.g. system update)
nix flake update

# update a single flake input
nix flake lock --update-input nixpkgs

# show contents of flake
nix flake show

# show flake info
nix flake info

# run flake app externally
nix run 'github:mayniklas/nixos#owncast'

# run flake app
nix run nixpkgs#python39 -- --version  

# lists all syslinks into the nix store (helpfull for finding old builds that can be deleted)
nix-store --gc --print-roots

# delete unused elements in nix store
nix-collect-garbage

# also delete iterations
nix-collect-garbage -d

# use auto formatter on flake.nix
nix fmt flake.nix
```
