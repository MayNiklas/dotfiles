{ config, pkgs, lib, ... }: {
  imports = [ ./git.nix ./vim ./zsh.nix ];

  home = { stateVersion = "21.11"; };

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
