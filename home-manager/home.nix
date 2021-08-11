{ config, pkgs, lib, ... }: {
  imports = [ ./git ./vim ./zsh ];

  home = {
    stateVersion = "21.11";
    packages = with pkgs; [
      ansible
      drone-cli
      glances
      gradle
      hugo
      iperf
      nmap
      wget
      wakeonlan
    ];
  };

  programs = {
    # let home-manager manage itself
    home-manager.enable = true;

    htop = {
      enable = true;
      settings = {
        tree_view = true;
        show_cpu_usage = true;
        show_program_path = false;
      };
    };
  };
}
