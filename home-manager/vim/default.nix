{ lib, pkgs, config, ... }: {

  xdg = {
    enable = true;
    configFile = {

      nvim_lua_config = {
        target = "nvim/lua/config";
        source = ./lua/config;
      };

    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
      ansible-vim
      vim-better-whitespace
      vim-nix
    ];
  };

}
