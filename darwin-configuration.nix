{ config, pkgs, ... }:
let
  home-manager =
    builtins.fetchGit { url = "https://github.com/rycee/home-manager.git"; };
in {
  imports = [ (import "${home-manager}/nix-darwin") ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ nixfmt wget vim ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  nixpkgs.config.allowUnfree = true;
  nix = {
    allowedUsers = [ "nik" ];
    package = pkgs.nix;

    gc = {
      automatic = true;
      user = "nik";
      options = "--delete-older-than 7d";
    };
  };

  users.users.nik = {
    home = "/Users/nik";
    shell = pkgs.zsh;
  };

  programs = { zsh.enable = true; };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.nik = import ./nik.nix;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
