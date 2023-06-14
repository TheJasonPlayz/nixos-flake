{
  description = " Jason Whitman's NixOS flake ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nurpkgs.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nurpkgs, home-manager, ... }:
    let
      username = "jasonw";
      system = "x86_64-linux";

      inherit (nixpkgs.lib) nixosSystem;
    in {
      nixosConfigurations.main-desktop = nixosSystem {
        inherit system;
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit username; };
            home-manager.users.jasonw = import ./home/home.nix;
          }
        ];
      };
    };
}
