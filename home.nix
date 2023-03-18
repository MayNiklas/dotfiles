{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
    # my packages
    whisper_cli

    # desktop apps
    obsidian

    # nix tools
    nixpkgs-fmt

    # network tools
    iperf
    nmap
    wakeonlan

    # devops tools
    ansible
    glances
    hugo
    wget

    # dev tools
    rpiboot
  ];

  programs.command-not-found.enable = true;

  # Include man-pages
  manual.manpages.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nik";
  home.homeDirectory = "/Users/nik";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
