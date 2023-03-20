{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
    # my packages
    whisper_cli

    # desktop apps
    obsidian

    # nix tools
    nixpkgs-fmt

    # communication tools
    # -> when installing those through nix,
    # spotlight can't fint them
    # discord
    # element-desktop

    # network tools
    iperf
    nmap
    speedtest-cli
    wakeonlan
    wireshark

    # devops tools
    ansible
    ansible-lint
    glances
    glances
    hugo
    terraform
    wget

    # dev tools
    asciinema
    go
    pre-commit
    rpiboot
    texlive.combined.scheme-full
  ];

  programs = {
    git = {
      enable = true;
      ignores = [
        "tags"
        "*.swp"
        # Nix builds
        "result"
        # Core latex/pdflatex auxiliary files
        "*.aux"
        "*.lof"
        "*.log"
        "*.lot"
        "*.fls"
        "*.out"
        "*.toc"
        "*.fmt"
        "*.fot"
        "*.cb"
        "*.cb2"
        ".*.lb"
        # Python
        "__pycache__/"
        "*.py[cod]"
        "*$py.class"
        ".Python"
        "build/"
        "develop-eggs/"
        "dist/"
      ];
      extraConfig = { pull.rebase = false; };
      userEmail = "info@niklas-steffen.de";
      userName = "MayNiklas";
    };
  };

  programs.htop = {
    enable = true;
    settings = {
      cpu_count_from_one = 1;
      show_cpu_usage = true;
      show_program_path = true;
      fields = with config.lib.htop.fields; [
        PID
        USER
        M_RESIDENT
        M_SHARE
        PERCENT_CPU
        PERCENT_MEM
        TIME
        COMM
      ];
    };
  };

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
