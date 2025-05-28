{
  description = "Home Manager configuration with flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations.usereal = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };

      modules = [
        {
          home.username = "usereal";                                                
          home.homeDirectory = "/home/usereal";
        }  
        ./users/usereal.nix
      ];
    };

    homeConfigurations.root = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };  
      modules = [
        {
          home.username = "root";
          home.homeDirectory = "/root";
        }
        ./users/root.nix
      ];
    };
  };
}

