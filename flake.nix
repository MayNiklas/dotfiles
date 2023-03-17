{
  description = "Home Manager configuration of Nik";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    whisper_api.url = "github:MayNiklas/whisper_api";
  };

  outputs = { self, ... }@inputs:
    with inputs;
    {

      homeConfigurations."nik@MacBook-Pro-14-2021" =
        let
          system = "aarch64-darwin";
          pkgs = import nixpkgs { inherit system; };
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              nixpkgs = {
                overlays = [
                  (self: super: {
                    whisper_cli = whisper_api.packages.${system}.whisper_cli;
                  })
                ];
                config = { allowUnfree = true; };
              };
            }
            ./home.nix
          ];
          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
          extraSpecialArgs = { } // inputs;
        };

    };
}
