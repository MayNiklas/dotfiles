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
# switch to new configuration
nix run .#homeConfigurations.nik.activationPackage
```
